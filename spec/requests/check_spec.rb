require "rails_helper"

RSpec.describe "healthcheck endpoint", type: :request do
  it "responds with 200 response" do
    response = get "/check"
    expect(response).to eq(200)
  end
end
