require "rails_helper"

RSpec.describe ContentController, type: :controller do
  let(:top_level_page) { FactoryBot.create(:content_page, :top_level) }
  describe "GET a top level page" do
    it "returns a top level page" do
      get "/content/#{top_level_page.slug}"
      expect(response).to have_http_status(200)
    end
  end
end
