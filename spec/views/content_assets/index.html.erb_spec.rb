require "rails_helper"

RSpec.describe "content_assets/index", type: :view do
  before(:each) do
    @content_assets = [
      FactoryBot.create(:content_asset, title: "title 1", alt: "hello"),
      FactoryBot.create(:content_asset, title: "title 2", alt: "hello 2 u"),
    ]
  end

  it "renders a list of content_assets" do
    render
    @content_assets.each do |asset|
      rendered.include? asset.title
      rendered.include? asset.alt
    end
  end
end
