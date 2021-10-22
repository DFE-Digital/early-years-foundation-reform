require "rails_helper"

RSpec.describe "Listing articles", type: :feature do
  context "without session" do
    scenario "go to user administration page" do
      visit "/admin/articles"
      expect(current_path).to eq("/users/sign_in")
    end
  end

  context "with session" do
    scenario "visits article admin" do
      create :article, title: "A typical support article"
      create :article, title: "Another support article", description: "Description of another support article"
      login_as(create(:editor))
      visit "/admin/articles#draft"
      expect(current_path).to eq(admin_articles_path)
      active_nav = page.find_by_id("navigation").first("li.govuk-header__navigation-item--active")
      title = page.find("h1")
      expect(active_nav).to have_css("a[href='/admin/articles']", visible: true, text: "Articles")
      expect(title).to have_text("Articles")

      expect(page).to have_link(href: "/admin/articles/new", visible: true, text: "Add article")

      expect(page).to have_css("th", text: "Description")

      expect(page).to have_css("td", text: "Description of another support article")
    end

    scenario "delete listed article" do
      create :article, title: "Delete me", description: "Description of delete me"
      login_as(create(:editor))
      visit "/admin/articles#draft"
      expect(page).to have_text("Description of delete me")
      click_on "Delete"
      accept_confirm "Are you sure you want to delete?"
      expect(page).to_not have_text("Descriptin of delete me")
    end
  end
end
