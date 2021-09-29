require "rails_helper"

RSpec.describe "Edit article" do
  before do
    login_as(create(:admin))
    create :article, title: "Old wrong title"
  end

  scenario "edit title and markdown" do
    visit "admin/articles"
    click_link "Edit"
    fill_in "article-title-field", with: "New correct title"
    fill_in "article-markdown-field", with: "## An H2 Headline"
    click_button "Save"
    expect(page).to have_text "New correct title"
    expect(page).to have_text "An H2 Headline"
  end
end
