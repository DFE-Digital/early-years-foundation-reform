require "rails_helper"

# Specs in this file have access to a helper object that includes
# the ContentHelper.

RSpec.describe ContentHelper, type: :helper do
  let(:child) do
    parent = FactoryBot.create(:content_page)
    FactoryBot.create(:content_page, parent_id: parent.id)
  end

  describe "paths for content" do
    it "returns the correct path for a top level page" do
      expect(path_for_this_page(child.parent)).to eq("/" + child.parent.slug)
    end

    it "returns the correct path for a child level page" do
      expect(path_for_this_page(child)).to eq("/" + child.parent.slug + "/" + child.slug)
    end
  end
end
