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
end
