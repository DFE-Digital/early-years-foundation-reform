require 'rails_helper'

RSpec.describe "content_assets/show", type: :view do
  before(:each) do

    @content_asset = assign(:content_asset, ContentAsset.new(
      title: "Title"
    ))
    file_path = Rails.root.join('spec/fixtures/sample.jpeg')
    file = fixture_file_upload(file_path, 'image/jpeg')
    @content_asset.avatar.attach(file)
    @content_asset.save!

  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
