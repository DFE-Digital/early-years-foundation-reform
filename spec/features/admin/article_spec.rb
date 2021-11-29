require "rails_helper"

RSpec.describe "Edit article", type: :feature do
  context "draft articles" do
    before do
      login_as(create(:admin))
      create :article, title: "Old wrong title"
      visit "admin/articles#draft"
    end

    scenario "edit title and markdown and then publish" do
      click_link "Edit"
      fill_in "article-title-field", with: "New correct title"
      fill_in "article-markdown-field", with: "## An H2 Headline"
      click_button "Save"
      expect(page).to have_text "New correct title"
      expect(page).to have_text "An H2 Headline"
    end

    scenario "publish" do
      click_link "Preview and publish"
      click_link "Publish"
      expect(page).to have_text "Article successfully published"
    end
  end

  context "published and unpublished articles" do
    before do
      login_as(create(:admin))
      create :article, :published, title: "Old wrong title", description: "this is the description"
      create :article, :unpublished, title: "Unpublished title", description: "the unpublished article description"
      visit "admin/articles#published"
    end

    scenario "edit title and markdown" do
      click_link "Edit"
      fill_in "article-title-field", with: "New correct title"
      fill_in "article-markdown-field", with: "## An H2 Headline"
      click_button "Save"
      expect(page).to have_text "Article successfully updated"
      expect(page).to have_text "New correct title"
      expect(page).to have_text "An H2 Headline"
    end

    scenario "unpublish, edit and delete article" do
      click_link "Preview and unpublish"
      click_link "Unpublish"
      expect(page).to have_text "Article successfully unpublished"
    end

    scenario "delete unpublished article" do
      visit "admin/articles#unpublished"
      expect(page).to have_text "the unpublished article description"
      click_link "Delete"
      accept_confirm "Are you sure you want to delete?"
      expect(page).to have_text "Article successfully deleted"
      expect(page).to_not have_text "the unpublished article description"
    end
  end
end
