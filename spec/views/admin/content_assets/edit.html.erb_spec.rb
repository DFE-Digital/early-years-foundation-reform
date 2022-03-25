require "rails_helper"

RSpec.describe "admin/content_assets/edit", type: :view do
  before(:each) do
    @content_asset = FactoryBot.create(:content_asset)
    @folder_options = [
      FactoryBot.create(:content_page),
      FactoryBot.create(:content_page),
    ]
  end

  it "renders the edit content_asset form" do
    render

    assert_select "form[action=?][method=?]", admin_content_asset_path(@content_asset), "post" do
      assert_select "input[name=?]", "content_asset[title]"
      assert_select "input[name=?]", "content_asset[alt_text]"
    end
    assert_select "input[name=?]", "clipboard_content"
  end
end
