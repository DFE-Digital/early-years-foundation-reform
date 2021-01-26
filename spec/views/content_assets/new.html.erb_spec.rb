require 'rails_helper'

RSpec.describe "content_assets/new", type: :view do
  before(:each) do
    assign(:content_asset, FactoryBot.build(:content_asset))
  end

  it "renders new content_asset form" do
    render

    assert_select "form[action=?][method=?]", content_assets_path, "post" do
      assert_select "input[name=?]", "content_asset[title]"
    end
  end
end
