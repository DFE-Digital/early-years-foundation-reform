require 'rails_helper'

#
# The response cache prepends onto Contentful::Client.get_http and caches the raw
# JSON response (a String) — not the deserialized object. These specs use a
# throwaway client class with the module prepended, so no real Contentful calls.
#
RSpec.describe ContentfulResponseCache do
  # A throwaway "Contentful client": counts how many times it actually fetches, and
  # returns whatever raw responses are queued.
  let(:client) do
    Class.new {
      class << self
        attr_accessor :hits, :raws

        def get_http(_url, _query = {}, _headers = {}, _proxy = {}, _timeout = {})
          self.hits += 1
          raws.shift
        end
      end
    }.tap do |klass|
      klass.hits = 0
      klass.raws = []
      klass.singleton_class.prepend(described_class)
    end
  end
  let(:delivery_url) { 'https://cdn.contentful.com/spaces/x/environments/master/entries' }

  # Stand-in for the `http` gem's raw response.
  def raw(status, body, encoding = nil)
    instance_double(HTTP::Response).tap do |response|
      allow(response).to receive_messages(status:, to_s: body, headers: { 'Content-Encoding' => encoding })
    end
  end

  around do |example|
    previous = Rails.cache
    Rails.cache = ActiveSupport::Cache::MemoryStore.new
    Rails.cache.clear
    example.run
    Rails.cache = previous
  end

  before { allow(Page).to receive(:cache_key).and_return('v1') }

  it 'serves the second delivery call from the cache (one Contentful hit)' do
    client.raws = [raw(200, '{"items":[]}')]

    first = client.get_http(delivery_url, {})
    second = client.get_http(delivery_url, {})

    expect(first.to_s).to eq('{"items":[]}')
    expect(second.to_s).to eq('{"items":[]}')
    expect(second.status).to eq(200)
    expect(client.hits).to eq(1)
  end

  it 'reconstructs status, body and Content-Encoding from the cache' do
    client.raws = [raw(200, 'GZIPPED-BYTES', 'gzip')]
    client.get_http(delivery_url, {}) # populate

    cached = client.get_http(delivery_url, {})

    expect(cached.status).to eq(200)
    expect(cached.to_s).to eq('GZIPPED-BYTES')
    expect(cached.headers['Content-Encoding']).to eq('gzip')
    expect(client.hits).to eq(1)
  end

  it 'rolls the cache when the content version (cache_key) changes' do
    client.raws = [raw(200, 'v1-body'), raw(200, 'v2-body')]

    expect(client.get_http(delivery_url, {}).to_s).to eq('v1-body')

    allow(Page).to receive(:cache_key).and_return('v2') # webhook bumped the version
    expect(client.get_http(delivery_url, {}).to_s).to eq('v2-body')
    expect(client.hits).to eq(2)
  end

  it 'does not cache non-200 responses' do
    client.raws = [raw(500, 'err'), raw(500, 'err')]

    client.get_http(delivery_url, {})
    client.get_http(delivery_url, {})

    expect(client.hits).to eq(2)
  end

  it 'does not cache non-delivery hosts (preview/management)' do
    preview_url = 'https://preview.contentful.com/spaces/x/environments/master/entries'
    client.raws = [raw(200, 'a'), raw(200, 'b')]

    client.get_http(preview_url, {})
    client.get_http(preview_url, {})

    expect(client.hits).to eq(2)
  end

  it 'is a no-op without a shared cache (NullStore)' do
    Rails.cache = ActiveSupport::Cache::NullStore.new
    client.raws = [raw(200, 'x'), raw(200, 'x')]

    client.get_http(delivery_url, {})
    client.get_http(delivery_url, {})

    expect(client.hits).to eq(2)
  end
end
