require "rails_helper"

RSpec.describe "admin/content_assets/new", type: :view do
  before(:each) do
    assign(:content_asset, FactoryBot.build(:content_asset))
    @folder_options = [
      FactoryBot.create(:content_page),
      FactoryBot.create(:content_page),
    ]
  end

  it "renders new content_asset form" do
    render

    assert_select "form[action=?][method=?]", admin_content_assets_path, "post" do
      assert_select "input[name=?]", "content_asset[title]"
    end
  end
end
