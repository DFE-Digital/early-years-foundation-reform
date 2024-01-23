require "rails_helper"

RSpec.feature "Admin Content Pages", type: :feature do
  context "without session" do
    scenario "go to content pages page" do
      visit admin_content_pages_path
      expect(current_path).to eq("/users/sign_in")
    end
  end

  context "with session" do
    scenario "should get index page" do
      login_as(FactoryBot.create(:user))
      visit admin_content_pages_path
      expect(current_path).to eq(admin_content_pages_path)
    end
    scenario "with logout button visible" do
      pending 'update to turbo-rails for devise'
      login_as(FactoryBot.create(:user))
      visit admin_content_pages_path
      expect(page).to have_css("a[href='/users/sign_out']", visible: true)
      find("a[href='/users/sign_out']").click
      expect(current_path).to eq("/users/sign_in")
    end
  end
end
