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

  it 'displays the feedback section on the page' do
    # Check for specific content on the page
    expect(page).to have_content('Give feedback to help us improve this website')

    # Check for the feedback link/button
    expect(page).to have_link(href: Rails.configuration.feedback_url)
  end

  # Check for the footer links
  it 'displays the feedback link' do
    expect(page).to have_link(I18n.t('links.footer.feedback'), href: Rails.configuration.feedback_url)
  end

  it 'displays the privacy policy link' do
    expect(page).to have_link(I18n.t('links.footer.privacy_policy'), href: Rails.configuration.privacy_policy_url)
  end
end
