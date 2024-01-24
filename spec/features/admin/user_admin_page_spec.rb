require "rails_helper"

RSpec.describe "User administration", type: :feature do
  before do
    create :admin, first_name: "Barbara", last_name: "Gordon", email: "birdsofprey@education.gov.uk"
    create :editor, first_name: "Perry", last_name: "White", email: "pwhite@education.gov.uk"
    create :editor, first_name: "J Jonah", last_name: "Jameson", email: "jjj@education.gov.uk"
  end

  context "without session" do
    scenario "go to user administration page" do
      visit "/admin"
      expect(current_path).to eq("/users/sign_in")
    end
  end

  context "with session" do
    let(:barbara) { User.find_by(email: "birdsofprey@education.gov.uk") }
    scenario "visits admin root" do
      login_as(barbara)
      visit "/admin"
      expect(current_path).to eq(admin_root_path)
      active_nav = page.find_by_id("navigation").first("li.govuk-header__navigation-item--active")
      title = page.find("h1")
      expect(active_nav).to have_css("a[href='/admin/users']", visible: true, text: "Admin")
      expect(title).to have_text("User administration")

      expect(page).to have_link(href: "/admin/users/new", visible: true, text: "Add user")

      expect(page).to have_css("th", text: "Name")
      expect(page).to have_css("th", text: "Email")
      expect(page).to have_css("th", text: "Role (CMS)")

      expect(page).to have_css("td", text: "Barbara Gordon")
      expect(page).to have_css("td", text: "Perry White")
      expect(page).to have_css("td", text: "J Jonah Jameson")
    end

    scenario "a user with admin role should not be able to assign herself to another role" do
      pending
      login_as(barbara)
      visit edit_admin_user_path(barbara)

      expect(page).to have_text("Your role is admin and you cannot change it")
    end

    scenario "the list of users should be ordered by email address, ascending" do
      login_as(barbara)

      visit admin_users_path
      expect_within_table_row(1, ["Barbara Gordon", "birdsofprey@education.gov.uk", "Administrator"])
      expect_within_table_row(2, ["J Jonah Jameson", "jjj@education.gov.uk", "Editor"])
      expect_within_table_row(3, ["Perry White", "pwhite@education.gov.uk", "Editor"])
    end

    scenario "An admin user should not be able to create a new user without providing a first name" do
      login_as(barbara)
      visit new_admin_user_path(barbara)

      fill_in "user-last-name-field", with: Faker::Name.last_name
      fill_in "user-password-field", with: "WordyWord2021%%"
      fill_in "user-password-confirmation-field", with: "WordyWord2021%%"
      choose("user-role-editor-field", visible: false)
      fill_in "user-email-field", with: "buzzard@education.gov.uk"

      click_button "Save"

      expect(page).to have_text("First name must not be blank")
    end

    scenario "An admin user should not be able to create a new user without providing a last name" do
      login_as(barbara)
      visit new_admin_user_path(barbara)

      fill_in "user-first-name-field", with: Faker::Name.first_name
      fill_in "user-password-field", with: "WordyWord2021%%"
      fill_in "user-password-confirmation-field", with: "WordyWord2021%%"
      choose("user-role-editor-field", visible: false)
      fill_in "user-email-field", with: "moggy@education.gov.uk"

      click_button "Save"

      expect(page).to have_text("Last name must not be blank")
    end
  end
end
