require "rails_helper"

RSpec.feature "View pages", type: :feature do
  given(:parent_page) { FactoryBot.create(:content_page, :published, :top_level) }
  given(:child_page) { FactoryBot.create(:content_page, :published, parent_id: parent_page.id) }
  given(:content_page_version) { FactoryBot.create(:content_page_version ) }

  scenario "Navigate to Content Pages" do
    sign_in FactoryBot.create(:user)
    visit "/admin/pages"

    expect(page).to have_text("Pages")
  end

  scenario "The CMS index page should not have any accessibility errors" do
    sign_in FactoryBot.create(:user)
    visit "/admin/pages"

    expect(page).to be_axe_clean
  end

  scenario "Navigate to a top level page and see the title can't be edited" do
    sign_in FactoryBot.create(:user)
    visit "/admin/pages/#{parent_page.id}/edit"

    page.find_field("content_page[title]", disabled: true)
  end

  scenario "Navigate to a child page and see the title can be edited" do
    sign_in FactoryBot.create(:user)
    visit "/admin/pages/#{child_page.id}/edit"

    page.find_field("content_page[title]", disabled: false)
  end

  scenario "The CMS edit page should not have any accessibility errors" do
    sign_in FactoryBot.create(:user)
    visit "/admin/pages/#{parent_page.id}/edit"

    expect(page).to be_axe_clean
  end

  scenario "A user with the role of editor should be able to edit pages in the CMS" do
    sign_in FactoryBot.create(:user, :editor)

    visit "/admin/pages/#{child_page.id}/edit"

    page.find_field("content_page[markdown]").set("some text")

    page.click_button("Save")
    saved_page = ContentPage.find child_page.id
    expect(saved_page.content_page_versions.last.markdown).to eq("some text")
  end

  scenario "A user with the role of reader should not be able to edit pages in the CMS" do
    sign_in FactoryBot.create(:user, :reader)
    attributes = FactoryBot.attributes_for :content_page

    visit "/admin/pages/#{child_page.id}/edit"

    page.find_field("content_page[title]").set(attributes[:title])
    page.find_field("content_page[markdown]").set(attributes[:markdown])
    page.find_field("content_page[position]").set(rand(10_000))

    page.click_button("Save")

    expect(page.body).to include("You don't have permission to change pages")
  end

  describe "A user with the role of editor should be able to create pages in the CMS" do
    it "should be able to create pages in the CMS" do
      sign_in FactoryBot.create(:user, :editor)
      attributes = FactoryBot.attributes_for :content_page

      visit "/admin/pages/new?parent_id=#{parent_page.id}"

      page.find_field("content_page[title]").set(attributes[:title])
      page.find_field("content_page[content_list]").set(attributes[:content_list])
      page.find_field("content_page[markdown]").set(attributes[:markdown])
      page.find_field("content_page[position]").set(rand(10_000))
      page.find_field("content_page[description]").set(attributes[:description])

      page.click_button("Save")

      saved_page = ContentPage.find_by_title attributes[:title]

      expect(saved_page.markdown).to eq(attributes[:markdown])
      expect(saved_page.content_list).to eq(attributes[:content_list])
      expect(saved_page.description).to eq(attributes[:description])
    end
  end

  scenario "The CMS create page page should not have any accessibility errors" do
    sign_in FactoryBot.create(:editor)

    visit "/admin/pages/new?parent_id=#{child_page.id}"

    expect(page).to be_axe_clean
  end

  scenario "A user with the role of reader should NOT be able to create pages in the CMS" do
    sign_in FactoryBot.create(:reader)
    attributes = FactoryBot.attributes_for :content_page

    visit "/admin/pages/new?parent_id=#{child_page.id}"

    page.find_field("content_page[title]").set(attributes[:title])
    page.find_field("content_page[content_list]").set(attributes[:content_list])
    page.find_field("content_page[markdown]").set(attributes[:markdown])
    page.find_field("content_page[position]").set(rand(10_000))
    page.click_button("Save")

    expect(page.body).to include("You don't have permission to create pages")
  end

  scenario "Navigate to a preview of live page and check that 2 print buttons are rendered on the page" do
    sign_in FactoryBot.create(:user)
    visit "/admin/pages/#{child_page.id}/preview_of_live"
    page.find('p', text: 'Contents', id: 'contents-list-heading')

    expect(page.body).to have_button('Print this page').twice
  end

  scenario "Navigate to a preview of live page and check that 1 print button is on the page" do
    content_page = FactoryBot.create(:content_page, :published, :top_level, :content_list_nil)
    sign_in FactoryBot.create(:user)
    visit "/admin/pages/#{content_page.id}/preview_of_live"

    expect(page.body).to have_button('Print this page').once
  end
end
