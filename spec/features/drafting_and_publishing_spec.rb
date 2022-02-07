require "rails_helper"

RSpec.feature "Drafting and publishing pages", type: :feature do
  describe "The life cycle of a page" do
    it "should create a new page as an unpublished draft" do
      sign_in FactoryBot.create(:user, :editor)
      attributes = FactoryBot.attributes_for :content_page
      parent_page = FactoryBot.create(:content_page, :top_level)

      visit "/admin/pages/new?parent_id=#{parent_page.id}"

      page.find_field("content_page[title]").set(attributes[:title])
      page.find_field("content_page[content_list]").set(attributes[:content_list])
      page.find_field("content_page[markdown]").set(attributes[:markdown])
      page.find_field("content_page[position]").set(rand(10_000))

      page.click_button("Save")

      saved_page = ContentPage.find_by_title attributes[:title]

      expect(saved_page.title).to eq(attributes[:title])
      expect(saved_page.is_published).to eq(false)
      expect(saved_page.content_page_versions.count).to eq(1)
    end
  end
end
