require 'rails_helper'

RSpec.describe "content_assets/edit", type: :view do
  before(:each) do
    @content_asset = assign(:content_asset, ContentAsset.new(
      title: "MyString"
    ))
    file_path = Rails.root.join('spec/fixtures/sample.jpeg')
    file = fixture_file_upload(file_path, 'image/jpeg')
    @content_asset.avatar.attach(file)
    @content_asset.save!

  end

  it "renders the edit content_asset form" do
    render

    assert_select "form[action=?][method=?]", content_asset_path(@content_asset), "post" do

      assert_select "input[name=?]", "content_asset[title]"
    end
  end
end
