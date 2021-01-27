require "rails_helper"

RSpec.describe "content_assets/index", type: :view do
  before(:each) do
    assign(:content_assets, [
      ContentAsset.create!(
        title: "Title",
      ),
      ContentAsset.create!(
        title: "Title",
      ),
    ])
  end

  it "renders a list of content_assets" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
  end
end
