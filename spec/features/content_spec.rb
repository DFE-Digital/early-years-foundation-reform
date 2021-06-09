require "rails_helper"

RSpec.feature "Public Content", type: :feature do
  given(:parent_page) { FactoryBot.create(:content_page, :top_level) }
  given(:child_page) { FactoryBot.create(:content_page, parent_id: parent_page.id) }

  scenario "Navigate to the landing page" do
    sign_in FactoryBot.create(:user)
    visit "/"

    expect(page).to be_axe_clean
  end

  scenario "Navigate to a top level page" do
    sign_in FactoryBot.create(:user)
    visit "/#{parent_page.slug}"

    expect(page).to be_axe_clean
  end
end
