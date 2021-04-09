require "rails_helper"

RSpec.describe "/accessibility_page", type: :request do
    include AuthHelper

    let(:authorization) do
        user = FactoryBot.create :user
        http_login(user.email, user.password)
      end
    
    describe "GET /show" do 
        it "renders the accessibility statement page" do 
            get "/accessibility-statement", headers: { "HTTP_AUTHORIZATION" => authorization }
            expect(response).to have_http_status(200)
            # expect(response).to render_template(:show)
            # expect(response.body).to include("Accessibility statement for the Help for early years providers service")          
        end
    end 
end
