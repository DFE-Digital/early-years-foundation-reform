require 'rails_helper'

RSpec.describe Page, type: :model do
  subject(:page) { described_class.by_slug(slug) }

  describe '.by_slug' do
    before { described_class.cache.clear }
    after { described_class.cache.clear }

    it 'does not cache nil results' do
      contentful_page = instance_double(described_class)

      allow(described_class).to receive(:find_by)
        .with(slug: 'home')
        .and_return([], [contentful_page])

      expect(described_class.by_slug('home')).to be_nil
      expect(described_class.by_slug('home')).to eq contentful_page
      expect(described_class).to have_received(:find_by).twice
    end

    context 'with a shared (Redis-style) cache' do
      around do |example|
        previous_cache = Rails.cache
        Rails.cache = ActiveSupport::Cache::MemoryStore.new
        example.run
        Rails.cache = previous_cache
      end

      before { Rails.cache.clear }

      it 'stores the result in the shared cache and reuses it' do
        allow(described_class).to receive(:find_by)
          .with(slug: 'home')
          .and_return([{ title: 'Home' }])

        expect(described_class.by_slug('home')).to eq({ title: 'Home' })
        expect(described_class.by_slug('home')).to eq({ title: 'Home' })
        expect(described_class).to have_received(:find_by).once
        expect(Rails.cache.read(described_class.send(:shared_key, described_class.to_key('home'))))
          .to eq({ title: 'Home' })
      end

      it 'does not cache nil results' do
        allow(described_class).to receive(:find_by)
          .with(slug: 'home')
          .and_return([], [{ title: 'Home' }])

        expect(described_class.by_slug('home')).to be_nil
        expect(described_class.by_slug('home')).to eq({ title: 'Home' })
        expect(described_class).to have_received(:find_by).twice
      end
    end
  end

  describe 'hierarchy' do
    context 'when home' do
      let(:slug) { 'home' }

      specify { expect(page).to be_root }
      specify { expect(page).not_to be_tier1 }
      specify { expect(page).not_to be_tier2 }
      specify { expect(page).not_to be_tier3 }
      specify { expect(page).not_to be_footer }
    end

    context 'when tier 1' do
      let(:slug) { 'areas-of-learning' }

      specify { expect(page).not_to be_root }
      specify { expect(page).to be_tier1 }
      specify { expect(page).not_to be_tier2 }
      specify { expect(page).not_to be_tier3 }
      specify { expect(page).not_to be_footer }
    end

    context 'when tier 2' do
      let(:slug) { 'communication-and-language' }

      specify { expect(page).not_to be_root }
      specify { expect(page).not_to be_tier1 }
      specify { expect(page).to be_tier2 }
      specify { expect(page).not_to be_tier3 }
      specify { expect(page).not_to be_footer }
    end

    context 'when tier 3' do
      let(:slug) { 'interactions' }

      specify { expect(page).not_to be_root }
      specify { expect(page).not_to be_tier1 }
      specify { expect(page).not_to be_tier2 }
      specify { expect(page).to be_tier3 }
      specify { expect(page).not_to be_footer }
    end

    context 'when footer' do
      let(:slug) { 'footer' }

      specify { expect(page).to be_root }
      specify { expect(page).not_to be_tier1 }
      specify { expect(page).not_to be_tier2 }
      specify { expect(page).not_to be_tier3 }
      specify { expect(page).not_to be_footer }

      describe 'page' do
        let(:slug) { 'accessibility' }

        specify { expect(page).not_to be_root }
        specify { expect(page).to be_tier1 }
        specify { expect(page).not_to be_tier2 }
        specify { expect(page).not_to be_tier3 }
        specify { expect(page).to be_footer }
      end
    end
  end

  describe '#breadcrumbs' do
    context 'when footer page' do
      let(:slug) { 'accessibility' }

      specify do
        expect(page.breadcrumbs).to be_a Hash
        expect(page.breadcrumbs.keys).to eq %w[
          Home
          Accessibility
        ]
        expect(page.breadcrumbs.values).to eq [
          '/',
          '/accessibility',
        ]
      end
    end

    context 'when tier 3' do
      let(:slug) { 'interactions' }

      specify do
        expect(page.breadcrumbs).to be_a Hash
        expect(page.breadcrumbs.keys).to eq [
          'Home',
          'Areas of learning',
          'Communication and language',
          'Interactions',
        ]
        expect(page.breadcrumbs.values).to eq [
          '/',
          '/areas-of-learning',
          '/areas-of-learning/communication-and-language',
          '/areas-of-learning/communication-and-language/interactions',
        ]
      end
    end
  end

  describe '#path' do
    context 'when tier 1' do
      let(:slug) { 'areas-of-learning' }

      specify { expect(page.path).to eq '/areas-of-learning' }
    end

    context 'when tier 2' do
      let(:slug) { 'communication-and-language' }

      specify { expect(page.path).to eq '/areas-of-learning/communication-and-language' }
    end

    context 'when tier 3' do
      let(:slug) { 'interactions' }

      specify { expect(page.path).to eq '/areas-of-learning/communication-and-language/interactions' }
    end
  end

  describe '#to_partial_path' do
    context 'when footer' do
      let(:slug) { 'accessibility' }

      specify { expect(page.to_partial_path).to eq 'default' }
    end

    context 'when tier 1' do
      let(:slug) { 'support-for-practitioners' }

      specify { expect(page.to_partial_path).to eq 'cards' }
    end

    context 'when tier 2' do
      let(:slug) { 'communication-and-language' }

      specify { expect(page.to_partial_path).to eq 'side_nav' }
    end

    context 'when tier 3' do
      let(:slug) { 'interactions' }

      specify { expect(page.to_partial_path).to eq 'side_nav' }
    end
  end

  describe 'Support content' do
    describe 'Tier 1' do
      let(:slug) { 'support-for-practitioners' }

      specify { expect(page).to be_children }
      specify { expect(page.pages.count).to be 13 }
    end

    describe 'Tier 2' do
      let(:slug) { 'reducing-paperwork' }

      specify { expect(page).not_to be_children }
      specify { expect(page.pages.count).to be 0 }
    end
  end

  describe '#thumbnail' do
    context 'with linked asset' do
      let(:slug) { 'reducing-paperwork' }

      it do
        expect(page.thumbnail).to be_a ContentfulModel::Asset
      end
    end

    context 'without linked asset' do
      let(:slug) { 'interactions' }

      it do
        expect(page.thumbnail).to be_nil
      end
    end
  end

  describe '#main-content' do
    context 'when tier 1' do
      let(:slug) { 'areas-of-learning' }

      it 'has the skip to main content link' do
        expect(page.main_content_link).to eq '/areas-of-learning#main-content'
      end
    end

    context 'when tier 2' do
      let(:slug) { 'communication-and-language' }

      it 'has the skip to main content link' do
        expect(page.main_content_link).to eq '/areas-of-learning/communication-and-language#main-content'
      end
    end

    context 'when tier 3' do
      let(:slug) { 'interactions' }

      it 'has the skip to main content link' do
        expect(page.main_content_link).to eq '/areas-of-learning/communication-and-language/interactions#main-content'
      end
    end
  end

  describe '.navigation_items' do
    around do |example|
      previous_cache = Rails.cache
      Rails.cache = ActiveSupport::Cache::MemoryStore.new
      example.run
      Rails.cache = previous_cache
    end

    before { Rails.cache.clear }

    it 'returns an empty list when a timeout occurs' do
      allow(described_class).to receive(:home).and_raise(HTTP::TimeoutError)

      expect(described_class.navigation_items).to eq([])
    end

    it 'returns an empty list when home is unavailable' do
      allow(described_class).to receive(:home).and_return(nil)

      expect(described_class.navigation_items).to eq([])
    end

    it 'returns stale values and enqueues a background refresh when fresh cache has expired' do
      stale_items = %w[cached-navigation-item]
      Rails.cache.write(described_class.to_key('navigation_items:stale'), stale_items, expires_in: 30.minutes)
      allow(described_class).to receive(:home).and_raise(HTTP::TimeoutError)
      allow(ContentfulLayoutCacheRefreshJob).to receive(:perform_later)

      expect(described_class.navigation_items).to eq(stale_items)
      expect(ContentfulLayoutCacheRefreshJob).to have_received(:perform_later).with('navigation_items')
    end
  end

  describe '.footer_items' do
    around do |example|
      previous_cache = Rails.cache
      Rails.cache = ActiveSupport::Cache::MemoryStore.new
      example.run
      Rails.cache = previous_cache
    end

    before { Rails.cache.clear }

    it 'returns an empty list when a timeout occurs' do
      allow(described_class).to receive(:footer).and_raise(HTTP::TimeoutError)

      expect(described_class.footer_items).to eq([])
    end

    it 'returns an empty list when footer is unavailable' do
      allow(described_class).to receive(:footer).and_return(nil)

      expect(described_class.footer_items).to eq([])
    end
  end

  describe '.with_contentful_resilience' do
    around do |example|
      previous_cache = Rails.cache
      Rails.cache = ActiveSupport::Cache::MemoryStore.new
      example.run
      Rails.cache = previous_cache
    end

    before { Rails.cache.clear }

    it 'retries timeout failures with backoff before succeeding' do
      attempts = 0
      allow(described_class).to receive(:contentful_sleep)

      result = described_class.with_contentful_resilience(context: 'spec-check', max_retries: 2) do
        attempts += 1
        raise HTTP::TimeoutError if attempts < 3

        :ok
      end

      expect(result).to eq(:ok)
      expect(described_class).to have_received(:contentful_sleep).twice
    end

    it 'opens the circuit after repeated failures' do
      allow(described_class).to receive(:contentful_sleep)

      5.times do
        expect {
          described_class.with_contentful_resilience(context: 'spec-circuit', max_retries: 0) do
            raise HTTP::TimeoutError
          end
        }.to raise_error(HTTP::TimeoutError)
      end

      expect {
        described_class.with_contentful_resilience(context: 'spec-circuit', max_retries: 0) { :ok }
      }.to raise_error(Caching::CIRCUIT_BREAKER_ERROR)
    end
  end
end
