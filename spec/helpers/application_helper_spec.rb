require 'rails_helper'

describe 'ApplicationHelper', type: :helper do
  describe '#html_title' do
    it 'shows content' do
      expect(helper.html_title(:foo, 'bar')).to have_content 'Help for early years providers : foo : bar'
    end
  end
end
