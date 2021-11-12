require "rails_helper"

RSpec.describe "Admin::Articles", type: :request do
  describe "GET /admin/articles" do
    it "works! (now write some real specs)" do
      login_as(create(:admin))
      get admin_articles_path
      expect(response).to have_http_status(200)
    end
  end

  describe "PUTS /article/:id" do
    let(:article) { create :article }

    before { sign_in create(:admin) }

    it "displays a flash message" do
      put admin_article_path(article), params: { article: { title: "Foo" } }
      expect(flash[:notice]).to eq("Article successfully updated")
    end
  end
end
