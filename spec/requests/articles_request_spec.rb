require "rails_helper"
require "axe-rspec"

RSpec.describe "Articles", type: :request do
  let(:a_page) do
    FactoryBot.create(:article, :published)
  end

  before :all do
    cookies[:track_analytics] = "true"
  end

  describe "GET /show" do
    it "renders a page" do
      get a_page.full_path
      expect(response).to be_successful
    end

    it "renders a 404 when the page is not found" do
      without_detailed_exceptions do
        get "#{a_page.full_path}rubbish"
        expect(response).to have_http_status :not_found
      end
    end
  end

  describe "GET /index" do
    it "renders a page" do
      get a_page.full_path
      expect(response).to be_successful
    end

    it "renders a 404 when the page is not found" do
      without_detailed_exceptions do
        get "#{a_page.full_path}rubbish"
        expect(response).to have_http_status :not_found
      end
    end
  end
end
