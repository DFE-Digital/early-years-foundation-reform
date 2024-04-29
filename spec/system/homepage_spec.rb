require 'rails_helper'

RSpec.describe 'Homepage' do
  before do
    visit '/'
  end

  specify do
    within '#hero-layout' do
      expect(page).to have_content 'Find helpful articles and resources to support you in your setting.'
    end
  end
end
