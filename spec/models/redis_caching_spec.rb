require 'rails_helper'

#
# Exercises the Redis-backed parts of the caching code against a *real*
# RedisCacheStore (not a MemoryStore), because RedisCacheStore differs in the exact
# place this relies on: `increment` is a Redis INCR, used by the circuit breaker.
#
# Content itself is NOT cached in Redis as objects (ContentfulModel objects don't
# survive marshalling) — cross-instance content caching is done at the HTTP layer
# (see config/initializers/contentful_response_cache.rb and its spec). What lives in
# Redis here is the shared circuit-breaker state.
#
# Skipped automatically when REDIS_URL is not configured / reachable.
#
RSpec.describe 'Redis-backed circuit breaker', type: :model do
  let(:redis_url) { ENV['REDIS_URL'].presence }

  # A second store pointed at the same Redis, to prove the breaker state is shared
  # across instances, not just process-local.
  let(:other_instance) { ActiveSupport::Cache::RedisCacheStore.new(url: redis_url) }

  around do |example|
    skip 'REDIS_URL is not configured' if redis_url.blank?

    store = ActiveSupport::Cache::RedisCacheStore.new(url: redis_url)
    begin
      store.write('__redis_probe__', '1')
    rescue StandardError => e
      skip "Redis is not reachable at #{redis_url}: #{e.class} - #{e.message}"
    end

    previous_cache = Rails.cache
    Rails.cache = store
    Rails.cache.clear
    example.run
    Rails.cache.clear
    Rails.cache = previous_cache
  end

  it 'opens the circuit after repeated failures and is visible to other instances' do
    allow(Page).to receive(:contentful_sleep)

    Caching::CIRCUIT_FAILURE_THRESHOLD.times do
      expect {
        Page.with_contentful_resilience(context: 'redis-circuit', max_retries: 0) do
          raise HTTP::TimeoutError
        end
      }.to raise_error(HTTP::TimeoutError)
    end

    # The "circuit open" flag was written to Redis (via INCR + write), so a second
    # instance short-circuits too.
    expect(other_instance.read('page:contentful_circuit_open')).to be_present

    expect {
      Page.with_contentful_resilience(context: 'redis-circuit', max_retries: 0) { :ok }
    }.to raise_error(Caching::CIRCUIT_BREAKER_ERROR)
  end

  it 'resets the failure count after a successful call' do
    # Seed a partial failure count (below the threshold, so the circuit is still
    # closed and the block is allowed to run).
    Rails.cache.write('page:contentful_failure_count', Caching::CIRCUIT_FAILURE_THRESHOLD - 2)

    expect(Page.with_contentful_resilience(context: 'redis-recover', max_retries: 0) { :ok }).to eq(:ok)

    expect(other_instance.read('page:contentful_failure_count')).to be_nil
  end
end
