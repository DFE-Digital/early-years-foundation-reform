require "rails_helper"
require "axe-rspec"

RSpec.describe "Contents", type: :request do
  let(:a_page) do
    parent = FactoryBot.create(:content_page, :published)
    FactoryBot.create(:content_page, :published, parent_id: parent.id)
  end

  before :all do
    cookies[:track_analytics] = "true"
  end

  describe "GET /show" do
    it "renders a page" do
      get a_page.full_path
      expect(response).to be_successful
    end

    it "includes the content page description in a meta tag" do
      get a_page.full_path
      expect(html_document.at("meta[name='description']")).to be_present
      expect(html_document.at("meta[name='description']")["content"]).to eq(a_page.description)
    end

    it "does not contain a meta description is content page description blank" do
      a_page.update!(description: "")
      get a_page.full_path
      expect(html_document.at("meta[name='description']")).to be_nil
    end

    it "renders a 404 when the page is not found" do
      without_detailed_exceptions do
        get "#{a_page.full_path}rubbish"
        expect(response).to have_http_status :not_found
      end
    end
  end

  describe "GET /" do
    it "renders the landing page / hub page" do
      get "/"
      expect(response).to be_successful
    end

    it "renders the content pages with HTTP headers to allow caching" do
      get "/"
      expect(response.headers["Cache-Control"]).to eq("max-age=3600, public")
    end
  end

  describe "Temporary authorisation on public site" do
    context "With the environment variable AUTH_ON_EVERYTHING set" do
      it "shows an auth dialog if the user is not already logged in" do
        cached_env_var = ENV["AUTH_ON_EVERYTHING"]
        ENV["AUTH_ON_EVERYTHING"] = "true"

        get "/"
        expect(response.status).to eq(302)

        ENV["AUTH_ON_EVERYTHING"] = cached_env_var
      end

      it "does not show an auth dialog if the user is already logged" do
        cached_env_var = ENV["AUTH_ON_EVERYTHING"] = "true"
        sign_in FactoryBot.create(:editor)

        get "/"

        expect(response.status).to eq(200)

        ENV["AUTH_ON_EVERYTHING"] = cached_env_var
      end
    end
  end
end
