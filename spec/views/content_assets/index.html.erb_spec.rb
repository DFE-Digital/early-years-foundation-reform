require 'rails_helper'

RSpec.describe "content_assets/index", type: :view do
  before(:each) do

    @content_asset = ContentAsset.new(title: "Title")
    @content_asset.avatar.attach(
      io: File.open(Rails.root.join("spec/fixtures/sample.jpeg")),
      filename: 'sample.jpeg',
      content_type: 'image/jpeg',
    )
    @content_asset.save!

    @content_asset2 = ContentAsset.new(title: "Title")
    @content_asset2.avatar.attach(
      io: File.open(Rails.root.join("spec/fixtures/sample.jpeg")),
      filename: 'sample.jpeg',
      content_type: 'image/jpeg',
    )
    @content_asset2.save!

    assign(:content_assets, [@content_asset, @content_asset2])
  end

  it "renders a list of content_assets" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
