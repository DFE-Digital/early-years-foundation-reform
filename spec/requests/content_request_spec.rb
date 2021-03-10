require "rails_helper"

RSpec.describe "Contents", type: :request do
  before(:each) do
    sign_in FactoryBot.create(:user)
  end

  let(:a_page) do
    parent = FactoryBot.create(:content_page)
    FactoryBot.create(:content_page, parent_id: parent.id)
  end

  describe "GET /show" do
    it "renders a final page as html" do
      get a_page.full_path
      expect(response).to be_successful
    end

    it "renders a final page as html" do
      get a_page.full_path + "rubbish"
      expect(response.status).to eq(404)
      expect(response).to_raise raise_error(ActionController::RoutingError)
    end
  end

  describe "GET /" do
    it "renders the landing page / hub page" do
      get "/"
      expect(response).to be_successful
    end

    xit "renders the desktop menu of content pages, two levels, in correct order" do
    end

    xit "renders the mobile menu of content pages, two levels, in correct order" do
    end
  end
end
