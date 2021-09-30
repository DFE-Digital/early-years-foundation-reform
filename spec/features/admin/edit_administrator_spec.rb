require "rails_helper"

RSpec.describe "Edit administrator", type: :feature do
  before do
    create :admin, first_name: "Barbara", last_name: "Gordon", email: "birdsofprey@education.gov.uk"
    create :editor, first_name: "Perry", last_name: "White", email: "pwhite@education.gov.uk"
    create :editor, first_name: "J Jonah", last_name: "Jameson", email: "jjj@education.gov.uk"
  end

  context "Updating administrators password" do
    it "displays correct error and allows it to be corrected" do
      login_as(FactoryBot.create(:admin))
      visit "/admin/users"
      barbara = User.admin.where(first_name: "Barbara").first
      expect(current_path).to eq(admin_users_path)
      nav = page.find_by_id("navigation").first("li.govuk-header__navigation-item")
      expect(nav).to have_css("a[href='/admin/users']", visible: true, text: "Admin")

      click_link "user_#{barbara.id}"

      fill_in "user-password-field", with: "invalid"
      fill_in "user-password-confirmation-field", with: "invalid"
      click_button "Save"

      expect(page).to have_text("Password must be a minimum of 8 characters long")
      fill_in "user-password-field-error", with: "ValidPassword12!@"
      fill_in "user-password-confirmation-field", with: "ValidPassword12!@"
      click_button "Save"

      expect(page).to have_text("User Barbara Gordon updated and password changed")
    end
  end
end
