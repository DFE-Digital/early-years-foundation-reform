require "rails_helper"

RSpec.describe "admin/content_assets/index", type: :view do
  before(:each) do
    @content_assets = [
      FactoryBot.create(:content_asset, title: "title 1", alt_text: "hello", page_name: "page name 1"),
      FactoryBot.create(:content_asset, title: "title 2", alt_text: "hello 2 u", page_name: "page name 2"),
    ]
  end

  it "renders a list of content_assets" do
    render
    @content_assets.each do |asset|
      rendered.include? asset.title
      rendered.include? asset.alt_text
      rendered.include? asset.page_name
    end
  end
end
