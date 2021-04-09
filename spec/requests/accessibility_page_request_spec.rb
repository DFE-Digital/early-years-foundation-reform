require "rails_helper"

RSpec.describe "/accessibility_page", type: :request do
  describe "GET /show" do
    it "renders the accessibility statement page" do
      get "/accessibility-statement"
      expect(response).to have_http_status(200)
      expect(response.body).to include("Accessibility statement for the Help for early years providers service")
    end
  end
end
