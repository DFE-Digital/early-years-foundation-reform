require "rails_helper"

RSpec.describe "Contents", type: :request do
  let(:a_page) do
    parent = FactoryBot.create(:content_page)
    FactoryBot.create(:content_page, parent_id: parent.id)
  end

  describe "GET /show" do
    it "renders a page" do
      get a_page.full_path
      expect(response).to be_successful
    end

    it "renders a 404 when the page is not found" do
      without_detailed_exceptions do
        get a_page.full_path + "rubbish"
        expect(response).to have_http_status :not_found
      end
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
