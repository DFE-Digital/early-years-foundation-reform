require "rails_helper"

RSpec.describe ApplicationController, type: :request do
  let(:json) { JSON.parse(response.body, symbolize_names: true) }

  describe "GET /check" do
    before { get check_path }

    it "renders successfully" do
      expect(response).to be_successful
    end

    it "returns JSON data" do
      expect(json[:status]).to eq("OK")
      expect(json[:version]).to eq("-")
      expect(json[:environment]).to eq("test")
      expect(json[:sha]).to be_blank
    end
  end
end
