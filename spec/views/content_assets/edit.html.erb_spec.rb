require 'rails_helper'

RSpec.describe "content_assets/edit", type: :view do
  before(:each) do

    @content_asset = ContentAsset.new(title: "test title")
    @content_asset.avatar.attach(
      io: File.open(Rails.root.join("spec/fixtures/sample.jpeg")),
      filename: 'sample.jpeg',
      content_type: 'image/jpeg',
    )
    @content_asset.save!

  end

  it "renders the edit content_asset form" do
    render

    assert_select "form[action=?][method=?]", content_asset_path(@content_asset), "post" do
      assert_select "input[name=?]", "content_asset[title]"
    end
  end
end
