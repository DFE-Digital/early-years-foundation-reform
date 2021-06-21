require "rails_helper"

RSpec.describe "/admin/users", type: :request do
  context "as admin" do
    describe "GET /index" do
      it "renders a successful response" do
        sign_in create(:admin)

        create_list(:editor, 10)

        get admin_users_path
        expect(response).to be_successful
      end
    end
  end

  context "not as admin" do
    describe "GET /index as editor" do
      it "renders a unsuccessful response" do
        sign_in create(:editor)

        create_list(:editor, 10)

        get admin_users_path
        expect(response).to_not be_successful
      end
    end
    
    describe "GET /index not signed in" do
      it "renders a unsuccessful response" do
        create_list(:editor, 10)

        get admin_users_path
        expect(response).to_not be_successful
      end
    end
  end
end
