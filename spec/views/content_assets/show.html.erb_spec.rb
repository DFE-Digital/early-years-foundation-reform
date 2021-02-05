require "rails_helper"

RSpec.describe "content_assets/show", type: :view do
  before(:each) do
    @content_asset = FactoryBot.create(:content_asset)
  end

  it "renders attributes" do
    render
    expect(rendered).to include(@content_asset.title)
    expect(rendered).to include(@content_asset.alt_text)
  end
end
