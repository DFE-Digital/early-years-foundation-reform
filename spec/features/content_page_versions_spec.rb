require "rails_helper"

RSpec.feature "View pages", type: :feature do
  given(:parent_page) { FactoryBot.create(:content_page, :published, :top_level) }
  given(:content_page_version) { FactoryBot.create(:content_page_version ) }

  scenario "Navigate to a preview of draft page and check that 2 print buttons are rendered on the page" do
    sign_in FactoryBot.create(:user)
    visit "/admin/pages/#{parent_page.id}/content_page_versions/#{content_page_version.id}/preview_of_draft"
    page.find('p', text: 'Contents', id: 'contents-list-heading')

    expect(page.body).to have_button('Print this page').twice
  end

  scenario "Navigate to a preview of draft page and check that 1 print button is on the page" do
    page_version = FactoryBot.create(:content_page_version, :content_list_empty)
    sign_in FactoryBot.create(:user)
    visit "/admin/pages/#{parent_page.id}/content_page_versions/#{page_version.id}/preview_of_draft"

    expect(page.body).to have_button('Print this page').once
  end
end
