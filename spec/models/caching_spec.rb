require 'rails_helper'

RSpec.describe Caching do
  around do |example|
    previous_cache = Rails.cache
    Rails.cache = ActiveSupport::Cache::MemoryStore.new
    Page.cache.clear
    example.run
    Page.cache.clear
    Rails.cache = previous_cache
  end

  describe '.reset_cache_key!' do
    it 'uses a new cache key for every invalidation' do
      timestamp = Time.zone.parse('2026-07-20T10:30:00Z')
      allow(SecureRandom).to receive(:uuid).and_return('first-version', 'second-version')

      Page.reset_cache_key!(timestamp)
      expect(Page.cache_key).to eq('first-version')

      Page.reset_cache_key!(timestamp)
      expect(Page.cache_key).to eq('second-version')
    end
  end
end
