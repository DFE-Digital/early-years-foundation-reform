require 'rails_helper'

RSpec.describe "content_assets/edit", type: :view do
  before(:each) do
    @content_asset = FactoryBot.create(:content_asset)
  end

  it "renders the edit content_asset form" do
    render

    assert_select "form[action=?][method=?]", content_asset_path(@content_asset), "post" do
      assert_select "input[name=?]", "content_asset[title]"
    end
  end
end
