require "rails_helper"

RSpec.feature "View pages", type: :feature do
  given(:parent_page) { FactoryBot.create(:content_page, :top_level) }
  given(:child_page) { FactoryBot.create(:content_page, parent_id: parent_page.id) }

  scenario "Navigate to Content Pages" do
    sign_in FactoryBot.create(:user)
    visit "/cms/pages"

    expect(page).to have_text("Pages")
  end

  scenario "The CMS index page should not have any accessibility errors" do
    sign_in FactoryBot.create(:user)
    visit "/cms/pages"

    expect(page).to be_axe_clean
  end

  scenario "Navigate to a top level page and see the title can't be edited" do
    sign_in FactoryBot.create(:user)
    visit "/cms/pages/#{parent_page.id}/edit"

    page.find_field("content_page[title]", disabled: true)
  end

  scenario "Navigate to a child page and see the title can be edited" do
    sign_in FactoryBot.create(:user)
    visit "/cms/pages/#{child_page.id}/edit"

    page.find_field("content_page[title]", disabled: false)
  end

  scenario "The CMS edit page should not have any accessibility errors" do
    sign_in FactoryBot.create(:user)
    visit "/cms/pages/#{parent_page.id}/edit"

    expect(page).to be_axe_clean
  end

  scenario "A user with the role of editor should be able to edit pages in the CMS" do
    pending("The way this works has changed - to use versions - test needs to be updated")
    sign_in FactoryBot.create(:user, :editor)

    visit "/cms/pages/#{child_page.id}/edit"

    page.find_field("content_page[markdown]").set("some text")

    page.click_button("Save")

    saved_page = ContentPage.find child_page.id

    expect(saved_page.markdown).to eq("some text")
  end

  scenario "A user with the role of reader should be not be able to edit pages in the CMS" do
    sign_in FactoryBot.create(:user, :reader)
    attributes = FactoryBot.attributes_for :content_page

    visit "/cms/pages/#{child_page.id}/edit"

    page.find_field("content_page[title]").set(attributes[:title])
    page.find_field("content_page[markdown]").set(attributes[:markdown])
    page.find_field("content_page[position]").set(rand(10_000))

    page.click_button("Save")

    expect(page.body).to include("You don't have permission to change pages")
  end

  describe "A user with the role of editor should be able to create pages in the CMS" do
    xit "should be able to create pages in the CMS" do
      sign_in FactoryBot.create(:editor)
      attributes = FactoryBot.attributes_for :content_page

      visit "/cms/pages/new?parent_id=#{parent_page.id}"

      page.find("#content-page-title-field", visible: :all).set(attributes[:title])
      page.find_field("content_page[markdown]").set(attributes[:markdown])
      page.find_field("content_page[position]").set(rand(10_000))

      page.click_button("Save")

      saved_page = ContentPage.find_by_title attributes[:title]

      expect(saved_page.title).to eq(attributes[:title])
    end
  end

  scenario "The CMS create page page should not have any accessibility errors" do
    sign_in FactoryBot.create(:editor)

    visit "/cms/pages/new?parent_id=#{parent_page.id}"
    # TO DO Form needs updating
    # expect(page).to be_axe_clean
  end

  scenario "A user with the role of reader should NOT be able to create pages in the CMS" do
    sign_in FactoryBot.create(:reader)
    attributes = FactoryBot.attributes_for :content_page

    visit "/cms/pages/new?parent_id=#{parent_page.id}"

    page.find_field("content_page[title]").set(attributes[:title])
    page.find_field("content_page[markdown]").set(attributes[:markdown])
    page.find_field("content_page[position]").set(rand(10_000))
    page.click_button("Save")

    expect(page.body).to include("You don't have permission to create pages")
  end
end
