require "rails_helper"

RSpec.describe "Govspeak", type: :request do
  let(:valid_params) do
    {
      input: "## Govspeak is magic!",
    }
  end

  describe "POST /show" do
    context "without a valid session" do
      it "redirects to login" do
        post "/govspeak", params: valid_params
        expect(response).to redirect_to("/users/sign_in")
      end
    end

    context "with a valid session" do
      it "renders a successful response" do
        sign_in FactoryBot.create(:user, email: "govspeakguy@gmail.com")
        post "/govspeak", params: valid_params
        expect(response.content_type).to eq "application/json; charset=utf-8"
        expect(JSON.parse(response.body)).to have_key("html")
        expect(response).to be_successful
      end

      it "returns valid html" do
        sign_in FactoryBot.create(:user, email: "govspeakguy@gmail.com")
        post "/govspeak", params: valid_params
        expect(JSON.parse(response.body)["html"]).to include('<h2 id="govspeak-is-magic">Govspeak is magic!</h2>')
      end
    end
  end
end
