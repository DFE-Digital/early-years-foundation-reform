require "rails_helper"
require "axe-rspec"

RSpec.describe "Articles", type: :request do
  let(:a_page) do
    FactoryBot.create(:article)
  end

  before :all do
    cookies[:track_analytics] = "true"
  end

  describe "GET /show" do
    it "renders an article page" do
      get article_path(a_page)
      expect(response).to be_successful
    end

    it "renders a 404 when the page is not found" do
      without_detailed_exceptions do
        get "#{article_path(a_page)}rubbish"
        expect(response).to have_http_status :not_found
      end
    end
  end

  describe "GET /index" do
    it "renders support articles landing page" do
      get "/articles"
      expect(response).to be_successful
    end

    it "renders a 404 when the page is not found" do
      without_detailed_exceptions do
        get "/articlesss"
        expect(response).to have_http_status :not_found
      end
    end
  end
end
