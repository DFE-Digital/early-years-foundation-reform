require "rails_helper"

RSpec.feature "View pages", type: :feature do
  scenario "Navigate to Content Pages" do
    visit "/content_pages"

    expect(page).to have_text("Pages")
  end
end
