require "rails_helper"

RSpec.describe Admin::ArticlesController, type: :request do
  let(:article) { create :complete_article }
  let(:incomplete_article) { create :article }

  before { login_as create(:admin) }

  context "an incomplete article" do
    describe "POST /admin/articles/:id/publish" do
      subject { post publish_admin_article_path(incomplete_article) }

      it "sets the status to published" do
        expect { subject }.to raise_error Pundit::NotAuthorizedError
      end
    end
  end

  context "a complete article" do
    describe "POST /admin/articles/:id/publish" do
      subject { post publish_admin_article_path(article) }

      it "sets the status to published" do
        expect { subject }.to(change { article.reload.status }.to("published"))
      end

      it "sets published_at" do
        expect { subject }.to(change { article.reload.published_at.present? }.to(true))
      end

      it "redirects to index page's anchor published" do
        expect(subject).to redirect_to(admin_articles_path(anchor: "published"))
      end
    end

    describe "POST /admin/articles/:id/unpublish" do
      subject { post unpublish_admin_article_path(article) }

      it "sets the status to unpublished" do
        expect { subject }.to(change { article.reload.status }.to("unpublished"))
      end

      it "sets unpublished_at" do
        expect { subject }.to(change { article.reload.unpublished_at.present? }.to(true))
      end

      it "redirects to index page's anchor unpublished" do
        expect(subject).to redirect_to(admin_articles_path(anchor: "unpublished"))
      end
    end

    describe "GET /admin/articles" do
      it "renders successfully" do
        get admin_articles_path
        expect(response).to be_successful
      end
    end

    describe "POST /admin/articles" do
      let(:params) do
        { article: attributes_for(:article) }
      end
      subject { post admin_articles_path, params: params }

      it "creates a new article" do
        expect { subject }.to change(Article, :count).by(1)
      end

      it "redirects to the index view's draft anchor" do
        expect(subject).to redirect_to(admin_articles_path(anchor: "draft"))
      end

      context "with invalid input" do
        let(:params) do
          { article: attributes_for(:article).except(:title) }
        end

        it "does not create a new article" do
          expect { subject }.not_to change(Article, :count)
        end

        it "displays the form" do
          subject
          expect(response).to be_successful
        end
      end
    end

    describe "GET /admin/articles/new" do
      it "renders successfully" do
        get new_admin_article_path
        expect(response).to be_successful
      end
    end

    describe "GET /admin/articles/:id/edit" do
      it "renders successfully" do
        get edit_admin_article_path(article)
        expect(response).to be_successful
      end
    end

    describe "GET /admin/articles/:id" do
      it "renders successfully" do
        get admin_article_path(article)
        expect(response).to be_successful
      end
    end

    describe "PATCH /admin/articles/:id" do
      let(:title) { Faker::Commerce.product_name }
      let(:params) do
        { article: { title: title } }
      end
      subject { patch admin_article_path(article), params: params }

      it "updates the article" do
        original_title = article.title
        expect { subject }.to(change { article.reload.title }.from(original_title).to(title))
      end

      it "redirects to show view" do
        expect(subject).to redirect_to(admin_article_path(article))
      end

      context "with an invalid entry" do
        let(:title) { "" }

        it "does not update the article" do
          expect { subject }.not_to(change { article.reload.title })
        end

        it "displays the form" do
          subject
          expect(response).to be_successful
        end
      end
    end

    describe "DELETE /admin/articles/:id" do
      let!(:article) { create :article }
      subject { delete admin_article_path(article) }

      it "deletes the article" do
        expect { subject }.to change(Article, :count).by(-1)
      end

      it "redirects to index" do
        expect(subject).to redirect_to(admin_articles_path)
      end
    end
  end
end
