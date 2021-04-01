require "rails_helper"

RSpec.describe "Contents", type: :request do
  include AuthHelper

  let(:a_page) do
    parent = FactoryBot.create(:content_page)
    FactoryBot.create(:content_page, parent_id: parent.id)
  end

  let(:authorization) do
    user = FactoryBot.create :user
    http_login(user.email, user.password)
  end

  before :all do
    cookies[:track_google_analytics] = "true"
  end

  describe "GET /show" do
    it "renders a page" do
      get a_page.full_path, headers: { 'HTTP_AUTHORIZATION' => authorization }
      expect(response).to be_successful
    end

    it "renders a 404 when the page is not found" do
      without_detailed_exceptions do
        get a_page.full_path + "rubbish", headers: { 'HTTP_AUTHORIZATION' => authorization }
        expect(response).to have_http_status :not_found
      end
    end
  end

  describe "GET /" do
    it "renders the landing page / hub page" do
      get "/", headers: { 'HTTP_AUTHORIZATION' => authorization }
      expect(response).to be_successful
    end

    xit "renders the desktop menu of content pages, two levels, in correct order" do
    end

    xit "renders the mobile menu of content pages, two levels, in correct order" do
    end
  end

  describe "Temporary authorisation on public site" do
    # login to http basic auth
    include AuthHelper

    context "With the environment variable USE_BASIC_AUTH set" do
      it "shows a basic auth dialog if the user is not already logged in with Basic Auth" do
        cached_env_var = ENV["USE_BASIC_AUTH"]
        ENV["USE_BASIC_AUTH"] = "true"

        get "/"
        expect(response.status).to eq(401)

        ENV["USE_BASIC_AUTH"] = cached_env_var
      end

      # This test needs to pass before the PR is accepted
      it "does not show a basic auth dialog if the user is already logged in with Basic Auth" do
        cached_env_var = ENV["USE_BASIC_AUTH"] = "true"

        user = FactoryBot.create :user
        authorization = http_login user.email, user.password

        get "/", headers: { 'HTTP_AUTHORIZATION' => authorization }

        expect(response.status).to eq(200)

        ENV["USE_BASIC_AUTH"] = cached_env_var
      end
    end
  end
end
