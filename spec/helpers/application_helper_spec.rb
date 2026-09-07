require 'rails_helper'

describe 'ApplicationHelper', type: :helper do
  describe '#navigation' do
    it 'renders home navigation when CMS navigation is unavailable' do
      allow(Page).to receive(:home).and_return(nil)

      expect(helper.navigation).to include('Home')
    end
  end

  describe '#html_title' do
    it 'shows content' do
      expect(helper.html_title(:foo, 'bar')).to have_content 'Help for early years providers : foo : bar'
    end
  end

  describe '#show_important_banner' do
    context 'when SHOW_IMPORTANT_BANNER is true' do
      before { allow(ENV).to receive(:[]).with('SHOW_IMPORTANT_BANNER').and_return('true') }

      it 'returns true' do
        expect(helper.show_important_banner?).to be true
      end
    end

    context 'when SHOW_IMPORTANT_BANNER is false' do
      before { allow(ENV).to receive(:[]).with('SHOW_IMPORTANT_BANNER').and_return('false') }

      it 'returns false' do
        expect(helper.show_important_banner?).to be false
      end
    end
  end
end
