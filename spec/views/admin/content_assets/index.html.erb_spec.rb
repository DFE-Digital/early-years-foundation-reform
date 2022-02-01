require "rails_helper"

RSpec.describe "admin/content_assets/index", type: :view do
  before(:each) do
    @content_assets = [
      FactoryBot.create(:content_asset, title: "title 1", alt_text: "hello", content_page_id: 1),
      FactoryBot.create(:content_asset, title: "title 2", alt_text: "hello 2 u", content_page_id: 2),
    ]
  end

  it "renders a list of content_assets" do
    render
    @content_assets.each do |asset|
      rendered.include? asset.title
      rendered.include? asset.alt_text
      rendered.include? asset.content_page_id.to_s
    end
  end
end
