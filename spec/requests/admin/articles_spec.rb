require 'rails_helper'

RSpec.describe "Admin::Articles", type: :request do
  describe "GET /admin/articles" do
    it "works! (now write some real specs)" do
      get admin_articles_path
      expect(response).to have_http_status(200)
    end
  end
end
