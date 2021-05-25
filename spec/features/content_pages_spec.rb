require "rails_helper"

RSpec.feature "View pages", type: :feature do
  given(:parent_page) { FactoryBot.create(:content_page, :top_level) }
  given(:child_page) { FactoryBot.create(:content_page, parent_id: parent_page.id) }

  scenario "Navigate to Content Pages" do
    sign_in FactoryBot.create(:user)
    visit "/cms/pages"
    expect(page).to be_axe_clean

    expect(page).to have_text("Pages")
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

  scenario "A user with the role of editor should be able to edit pages in the CMS" do
    sign_in FactoryBot.create(:user, :editor)

    visit "/cms/pages/#{child_page.id}/edit"

    page.find_field("content_page[markdown]").set("some text")

    page.click_button("Update Content page")

    saved_page = ContentPage.find child_page.id

    expect(saved_page.markdown).to eq("some text")
  end

  scenario "A user with the role of reader should be not be able to edit pages in the CMS" do
    sign_in FactoryBot.create(:user, :reader)
    visit "/cms/pages/#{child_page.id}/edit"

    expect(page.body).to include("You don't have permission to edit pages")
  end

  scenario "A user with the role of editor should be able to create pages in the CMS" do
    sign_in FactoryBot.create(:user, :editor)
    attributes = FactoryBot.attributes_for :content_page

    visit "/cms/pages/new?parent_id=#{child_page.id}"

    page.find_field("content_page[title]").set(attributes[:title])
    page.find_field("content_page[markdown]").set(attributes[:markdown])
    page.find_field("content_page[position]").set(rand(10_000))

    page.click_button("Create Content page")

    saved_page = ContentPage.find_by_title attributes[:title]

    expect(saved_page.title).to eq(attributes[:title])
  end

  scenario "A user with the role of reader should NOT be able to create pages in the CMS" do
    sign_in FactoryBot.create(:user, :reader)
    attributes = FactoryBot.attributes_for :content_page

    visit "/cms/pages/new?parent_id=#{child_page.id}"

    page.find_field("content_page[title]").set(attributes[:title])
    page.find_field("content_page[markdown]").set(attributes[:markdown])
    page.find_field("content_page[position]").set(rand(10_000))
    page.click_button("Create Content page")

    expect(page.body).to include("You don't have permission to create pages")
  end
end
