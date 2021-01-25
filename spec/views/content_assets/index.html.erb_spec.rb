require 'rails_helper'

RSpec.describe "content_assets/index", type: :view do
  before(:each) do
    @content_asset = assign(:content_asset, ContentAsset.new(
      title: "Title"
    ))
    file_path = Rails.root.join('spec/fixtures/sample.jpeg')
    file = fixture_file_upload(file_path, 'image/jpeg')
    @content_asset.avatar.attach(file)
    @content_asset.save!

    @content_asset2 = assign(:content_asset, ContentAsset.new(
      title: "Title"
    ))
    file_path = Rails.root.join('spec/fixtures/sample.jpeg')
    file = fixture_file_upload(file_path, 'image/jpeg')
    @content_asset2.avatar.attach(file)
    @content_asset2.save!

    assign(:content_assets, [@content_asset, @content_asset2])
  end

  it "renders a list of content_assets" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
