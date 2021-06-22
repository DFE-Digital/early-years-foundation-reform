require "rails_helper"

RSpec.feature "User administration", type: :feature do
  before do
    create :admin, first_name: "Barbara", last_name: "Gordon", email: "birdsofprey@oracle.com"
    create :editor, first_name: "Perry", last_name: "White", email: "pwhite@dailyplanet.com"
    create :editor, first_name: "J Jonah", last_name: "Jameson", email: "jjj@dailybugle.com"
  end

  context "without session" do
    scenario "go to user administration page" do
      visit "/admin"
      expect(current_path).to eq("/users/sign_in")
    end
  end

  context "with session" do
    scenario "visits admin root" do
      login_as(FactoryBot.create(:editor))
      visit "/admin"
      expect(current_path).to eq(admin_root_path)
      active_nav = page.find_by_id("navigation").first("li.govuk-header__navigation-item--active")
      title = page.find("h1")
      expect(active_nav).to have_css("a[href='/admin/users']", visible: true, text: "Admin")
      expect(title).to have_text("User Administration")

      expect(page).to have_link(href: "/admin/users/new", visible: true, text: "Add User")

      expect(page).to have_css("th", text: "Name")
      expect(page).to have_css("th", text: "Email")
      expect(page).to have_css("th", text: "Role (CMS)")

      expect(page).to have_css("td", text: "Barbara Gordon")
      expect(page).to have_css("td", text: "Perry White")
      expect(page).to have_css("td", text: "J Jonah Jameson")
    end

    scenario "a user with admin role should not be able to assign herself to another role" do
      user_who_logs_in = FactoryBot.create(:admin)
      login_as(user_who_logs_in)
      visit edit_admin_user_path(user_who_logs_in)

      expect(page).to have_text("Your role is admin and you cannot change it")
    end
  end
end
