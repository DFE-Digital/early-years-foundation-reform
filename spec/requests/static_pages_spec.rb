require "rails_helper"

RSpec.describe "renders a static page" do
  it "accessibility-statement" do
    get "/accessibility-statement"
    expect(response).to be_successful
  end

  it "disclaimer" do
    get "/disclaimer"
    expect(response).to be_successful
  end
end
