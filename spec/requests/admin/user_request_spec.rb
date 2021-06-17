require "rails_helper"

RSpec.describe "/admin/users", type: :request do
  describe "GET /index" do
    it "renders a successful response" do
      sign_in FactoryBot.create(:user, :editor)

      FactoryBot.create_list(:user, 10)

      get admin_users_path
      expect(response).to be_successful
    end
  end
end
