require 'rails_helper'

xdescribe 'ApplicationHelper', type: :helper do
  describe '#html_title' do
    it 'shows content' do
      expect(page).to have_content 'content within html_title'
    end
  end
end
