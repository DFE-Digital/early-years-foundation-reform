require 'rails_helper'

RSpec.describe 'PoC' do
  before do
    visit '/'
  end

  specify do
    expect(page).to have_content 'Find helpful articles and resources to support you in your setting.'
  end
end
