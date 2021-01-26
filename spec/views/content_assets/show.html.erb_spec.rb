require "rails_helper"

RSpec.describe "content_assets/show", type: :view do
  before(:each) do
    @content_asset = assign(:content_asset, ContentAsset.create!(
                                              title: "Title",
                                            ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
