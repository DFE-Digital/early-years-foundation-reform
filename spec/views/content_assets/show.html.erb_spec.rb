require 'rails_helper'

RSpec.describe "content_assets/show", type: :view do
  before(:each) do
    @content_asset = ContentAsset.new(title: "Title")
    @content_asset.avatar.attach(
      io: File.open(Rails.root.join("spec/fixtures/sample.jpeg")),
      filename: 'sample.jpeg',
      content_type: 'image/jpeg',
    )
    @content_asset.save!
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
