require "rails_helper"

RSpec.describe "Listing articles", type: :system do
  before do
    driven_by(:rack_test)
    create :editor, first_name: "Perry", last_name: "White", email: "pwhite@education.gov.uk"
    create :article, title: "A typical support article", description: "And it's description", markdown: "For score and seven years ago..."
  end

  context "without session" do
    scenario "go to user administration page" do
      visit "/admin/articles"
      expect(current_path).to eq("/users/sign_in")
    end
  end

  context "with session" do
    let(:editor) { User.find_by(email: "pwhite@education.gov.uk") }
    scenario "visits article admin" do
      login_as(editor)
      visit "/admin/articles"
      expect(current_path).to eq(admin_articles_path)
      active_nav = page.find_by_id("navigation").first("li.govuk-header__navigation-item--active")
      title = page.find("h1")
      expect(active_nav).to have_css("a[href='/admin/articles']", visible: true, text: "Articles")
      expect(title).to have_text("Articles")

      expect(page).to have_link(href: "/admin/articles/new", visible: true, text: "Add article")

      expect(page).to have_css("th", text: "Title")
      expect(page).to have_css("th", text: "Description")

      expect(page).to have_css("td", text: "A typical support article")
    end
  end
end
