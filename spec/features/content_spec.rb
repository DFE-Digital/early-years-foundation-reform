require "rails_helper"

RSpec.feature "Public Content", type: :feature do
  before do
    skip 'WIP' if Rails.application.cms?
  end

  given(:parent_page) { FactoryBot.create(:content_page, :published, :top_level) }
  given(:child_page) { FactoryBot.create(:content_page, :published, parent_id: parent_page.id) }

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

  scenario "Navigate to a child page" do
    sign_in FactoryBot.create(:user)
    visit "/#{parent_page.slug}/#{child_page.slug}"

    expect(page).to be_axe_clean
  end
end
