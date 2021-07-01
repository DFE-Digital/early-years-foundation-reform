require "rails_helper"

# This spec is too slow to run with the main specs, and it does not directly
# test the main application, so it lives next to the LinkChecker service class
RSpec.feature "Public Content", type: :feature do
  context "Search for any broken links in a site" do
    it "finds the broken links" do
      broken_link = "https://bbc.co.uk/does_not_exist"
      broken_markdown = "[broken link](#{broken_link})"
      parent_page = FactoryBot.create(:content_page, :top_level)
      FactoryBot.create(:content_page, markdown: broken_markdown)
      FactoryBot.create(:content_page, :with_broken_links, parent_id: parent_page.id)

      visit "/"
      lc = LinkChecker.new "http://127.0.0.1:9999"
      results = lc.check_the_links.to_s

      expect(results).to include(broken_link)
    end
  end
end
