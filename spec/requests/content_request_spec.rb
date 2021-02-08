require "rails_helper"

RSpec.describe "Contents", type: :request do
  before(:each) do
    sign_in FactoryBot.create(:user)
  end

  let(:a_page) do
    FactoryBot.create(:content_page)
  end

  describe "GET /show" do
    it "renders a final page as html" do
      get content_page_url(a_page)
      expect(response).to be_successful
    end
  end
end
