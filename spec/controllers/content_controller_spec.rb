require "rails_helper"

RSpec.describe ContentController, type: :controller do
  let(:top_level_page) { FactoryBot.create(:content_page, :top_level) }
  describe "GET a top level page" do
    xit "returns a top level page" do
      get root_url + "#{top_level_page.slug}"
      expect(response).to have_http_status(200)
    end
  end

  xit "returns page not found when the page is not found" do
    get root_url + top_level_page.full_path.to_s + "rubbish"
    expect(response).to have_http_status(:not_found)
    expect(response.status).to raise_error(ActionController::RoutingError)
  end
end
