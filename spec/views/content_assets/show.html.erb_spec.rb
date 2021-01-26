require 'rails_helper'

RSpec.describe "content_assets/show", type: :view do
  before(:each) do
    @content_asset = FactoryBot.create(:content_asset)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
