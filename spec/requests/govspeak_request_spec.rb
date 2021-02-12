require "rails_helper"

RSpec.describe "Govspeak", type: :request do
  let(:valid_params) do
    {
      input: "## Govspeak is magic!",
    }
  end

  before(:each) do
    sign_in FactoryBot.create(:user, email: "govspeakguy@gmail.com")
  end

  describe "POST /show" do
    it "renders a successful response" do
      post "/govspeak", params: valid_params
      expect(response.content_type).to eq "application/json; charset=utf-8"
      expect(JSON.parse(response.body)).to have_key("html")
      expect(response).to be_successful
    end

    it "returns valid html" do
      post "/govspeak", params: valid_params
      expect(JSON.parse(response.body)["html"]).to include('<h2 id="govspeak-is-magic">Govspeak is magic!</h2>')
    end
  end
end
