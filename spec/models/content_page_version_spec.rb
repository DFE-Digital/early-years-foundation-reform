require "rails_helper"

RSpec.describe ContentPageVersion, type: :model do
  let(:content_page_version) { create :content_page_version }

  describe "#navigation" do
    it "returns true" do
      expect(content_page_version.navigation).to be(true)
    end
  end

  describe "#breadcrumbs" do
    it "returns true" do
      expect(content_page_version.breadcrumbs).to be(true)
    end
  end
end
