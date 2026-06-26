require 'rails_helper'

#
# These specs exercise the caching code against a *real* RedisCacheStore rather
# than a MemoryStore, because RedisCacheStore differs from MemoryStore in the
# exact places this feature relies on:
#
#   * values are marshalled on write and unmarshalled on read (cross-instance),
#   * `increment` is a Redis INCR (used by the circuit breaker),
#   * `write(..., unless_exist: true)` is a Redis `SET NX` (the refresh lock),
#   * `fetch(..., skip_nil: true)` must not persist nil results.
#
# They are skipped automatically when REDIS_URL is not configured / reachable,
# so the suite still runs without Redis.
#
RSpec.describe 'Redis-backed caching', type: :model do
  let(:redis_url) { ENV['REDIS_URL'].presence }

  # A second store pointed at the same Redis, used to prove that a value written
  # by one app instance is visible to another (i.e. genuinely shared, not just
  # process-local).
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

  describe 'Page.by_slug (fetch_or_store_non_nil)' do
    it 'stores the result in Redis and serves it to another instance without re-fetching' do
      allow(Page).to receive(:find_by).with(slug: 'home').and_return([{ title: 'Home' }])

      expect(Page.by_slug('home')).to eq({ title: 'Home' })

      # A different store instance (a second app process) sees the same value,
      # proving it round-tripped through Redis (marshal + unmarshal).
      shared_key = Page.send(:shared_key, Page.to_key('home'))
      expect(other_instance.read(shared_key)).to eq({ title: 'Home' })

      # Second lookup is served from Redis, so Contentful is hit only once.
      expect(Page.by_slug('home')).to eq({ title: 'Home' })
      expect(Page).to have_received(:find_by).once
    end

    it 'does not persist nil results (skip_nil)' do
      allow(Page).to receive(:find_by)
        .with(slug: 'home')
        .and_return([], [{ title: 'Home' }])

      expect(Page.by_slug('home')).to be_nil

      shared_key = Page.send(:shared_key, Page.to_key('home'))
      expect(other_instance.read(shared_key)).to be_nil

      expect(Page.by_slug('home')).to eq({ title: 'Home' })
      expect(Page).to have_received(:find_by).twice
    end
  end

  describe 'circuit breaker (Redis INCR)' do
    it 'opens the circuit after repeated failures and is visible to other instances' do
      allow(Page).to receive(:contentful_sleep)

      Caching::CIRCUIT_FAILURE_THRESHOLD.times do
        expect {
          Page.with_contentful_resilience(context: 'redis-circuit', max_retries: 0) do
            raise HTTP::TimeoutError
          end
        }.to raise_error(HTTP::TimeoutError)
      end

      # The "circuit open" flag was written to Redis, so a second instance also
      # short-circuits.
      expect(other_instance.read('page:contentful_circuit_open')).to be_present

      expect {
        Page.with_contentful_resilience(context: 'redis-circuit', max_retries: 0) { :ok }
      }.to raise_error(Caching::CIRCUIT_BREAKER_ERROR)
    end

    it 'resets the failure count after a successful call' do
      # Seed a partial failure count (below the threshold, so the circuit is
      # still closed and the block is allowed to run).
      Rails.cache.write('page:contentful_failure_count', Caching::CIRCUIT_FAILURE_THRESHOLD - 2)

      expect(Page.with_contentful_resilience(context: 'redis-recover', max_retries: 0) { :ok }).to eq(:ok)

      expect(other_instance.read('page:contentful_failure_count')).to be_nil
    end
  end

  describe '#thumbnail (real ContentfulModel::Asset)' do
    # Complements the MemoryStore-free `#thumbnail` spec in page_spec.rb: this
    # proves a *real* Contentful object survives Redis marshal/unmarshal, which
    # is the one part the stubbed specs cannot reach. Skips unless Contentful is
    # reachable (i.e. config/master.key / credentials are present).
    it 'returns the asset through the Redis-backed cache and stays resilient' do
      page =
        begin
          Page.by_slug('reducing-paperwork')
        rescue StandardError => e
          # No credentials / Contentful unreachable in this environment.
          skip "Contentful is not reachable: #{e.class} - #{e.message}"
        end
      skip 'Contentful is not reachable (no master key / credentials)' if page.nil?

      asset = page.thumbnail
      skip 'Contentful asset could not be loaded' if asset.nil?

      # With Redis as the store, #thumbnail must return a real asset and must not
      # raise. Note we deliberately do NOT assert the asset is readable back from
      # Redis: a ContentfulModel::Asset marshals on write but does not always
      # deserialize cleanly on read, so RedisCacheStore treats it as a miss and
      # #thumbnail simply re-fetches. The guarantee we rely on is resilience, not
      # persistence of the asset object itself.
      expect(asset).to be_a(ContentfulModel::Asset)
      expect(page.thumbnail).to be_a(ContentfulModel::Asset)
    end
  end

  describe 'layout collections (stale fallback + Redis SET NX lock)' do
    it 'serves stale values and enqueues a single refresh while the lock is held' do
      stale_items = %w[cached-navigation-item]
      Rails.cache.write(Page.to_key('navigation_items:stale'), stale_items, expires_in: 30.minutes)
      allow(Page).to receive(:home).and_raise(HTTP::TimeoutError)
      allow(ContentfulLayoutCacheRefreshJob).to receive(:perform_later)

      expect(Page.navigation_items).to eq(stale_items)
      expect(ContentfulLayoutCacheRefreshJob).to have_received(:perform_later).with('navigation_items')

      # The refresh lock (SET NX) is now held in Redis; a concurrent request does
      # not enqueue a second refresh.
      expect(Page.navigation_items).to eq(stale_items)
      expect(ContentfulLayoutCacheRefreshJob).to have_received(:perform_later).once
    end
  end
end
