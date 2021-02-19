require "rails_helper"

RSpec.feature "View pages", type: :feature do
  given(:parent_page) { FactoryBot.create(:content_page, :top_level) }
  given(:child_page) { FactoryBot.create(:content_page, parent_id: parent_page.id) }

  scenario "Navigate to Content Pages" do
    sign_in FactoryBot.create(:user)
    visit "/content_pages"

    expect(page).to have_text("Pages")
  end

  scenario "Navigate to a top level page and see the title can't be edited" do
    sign_in FactoryBot.create(:user)
    visit "/content_pages/#{parent_page.id}/edit"

    page.find_field("content_page[title]", disabled: true)
  end

  scenario "Navigate to a child page and see the title can be edited" do
    sign_in FactoryBot.create(:user)
    visit "/content_pages/#{child_page.id}/edit"

    page.find_field("content_page[title]", disabled: false)
  end
end
