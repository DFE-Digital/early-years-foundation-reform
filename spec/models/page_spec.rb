require 'rails_helper'

RSpec.describe Page, type: :model do
  subject(:page) { described_class.by_slug(slug) }

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
        expect(page.breadcrumbs.keys).to eq [
          'Home',
          'Accessibility',
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
    context 'when tier 3' do
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

  describe '#footer_path' do
    let(:slug) { 'accessibility' }

    specify { expect(page.footer_path).to eq '/accessibility' }
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
      specify { expect(page.pages.count).to be 10 }
    end

    describe 'Tier 2' do
      let(:slug) { 'reducing-paperwork' }

      specify { expect(page).not_to be_children }
      specify { expect(page.pages.count).to be 0 }
    end
  end
end
