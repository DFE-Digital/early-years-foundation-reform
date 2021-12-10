require "rails_helper"

RSpec.feature "New content assets page", type: :feature do
  scenario "should not have any accessibility errors" do
    sign_in create :admin
    visit new_admin_content_asset_path

    expect(page).to be_axe_clean
  end
end
