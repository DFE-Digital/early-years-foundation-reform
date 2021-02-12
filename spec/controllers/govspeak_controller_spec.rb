require "rails_helper"

RSpec.describe GovspeakController, type: :controller do
  describe "POST /govspeak" do
    context "with valid parameters" do
      let(:valid_params) do
        {
          input: "## Govspeak is magic!",
        }
      end

      it "returns a valid response" do
        post "show", params: valid_params

        expect(response.content_type).to eq "application/json; charset=utf-8"
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)).to have_key("html")
      end

      it "returns valid html" do
        post "show", params: valid_params
        expect(JSON.parse(response.body)["html"]).to include('<h2 id="govspeak-is-magic">Govspeak is magic!</h2>')
      end
    end
  end
end
