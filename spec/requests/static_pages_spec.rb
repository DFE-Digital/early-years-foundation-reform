require "rails_helper"

RSpec.describe "renders a static page" do
  it "accessibility-statement" do
    skip 'WIP' if Rails.application.cms?

    get "/accessibility-statement"
    expect(response).to be_successful
    expect(response.body).to include("Accessibility statement for the Help for early years providers service")
  end

  it "disclaimer" do
    get "/disclaimer"
    expect(response).to be_successful
  end
end
