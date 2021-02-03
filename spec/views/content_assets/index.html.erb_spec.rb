require "rails_helper"

RSpec.describe "content_assets/index", type: :view do
  before(:each) do
    asset_file = ActiveStorage::Blob.create_after_upload!(
      io: File.open("spec/fixtures/sample.jpeg", "rb"),
      filename: "sample.jpeg",
      content_type: "image/jpeg",
    ).signed_id
    @content_asset = ContentAsset.create!(title: "test title", avatar: asset_file, alt: "alt sample")
    @content_asset2 = ContentAsset.create!(title: "test title 2", avatar: asset_file, alt: "alt sample 2")

    @content_assets = [@content_asset, @content_asset2]
  end

  it "renders a list of content_assets" do
    render
    @content_assets.each do |asset|
      rendered.include? asset.title
      rendered.include? asset.alt
    end
  end

end
