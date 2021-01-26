require 'rails_helper'

RSpec.describe "content_assets/index", type: :view do
  before(:each) do

    @content_asset = FactoryBot.create(:content_asset)
    @content_asset2 = FactoryBot.create(:content_asset)

    assign(:content_assets, [@content_asset, @content_asset2])
  end

  it "renders a list of content_assets" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
