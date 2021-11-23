require "rails_helper"

RSpec.describe "/content_pages", type: :request do
  # ContentPage. As you add validations to ContentPage, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) { attributes_for(:content_page) }
  let(:other_valid_attributes) { attributes_for(:content_page) }
  let(:invalid_attributes) { attributes_for(:content_page, :invalid_title) }

  before(:each) do
    sign_in create(:editor)
  end

  describe "GET /index" do
    it "renders a successful response" do
      parent_page = create(:content_page)
      child_page = create(:content_page)

      get content_pages_url
      expect(response).to be_successful
      expect(response.body).to include(parent_page.title)
      expect(response.body).to include(child_page.title)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      content_page = create(:content_page, :published)
      get content_page_url(content_page)
      expect(response).to be_successful
    end

    context "with an unpublished content page" do
      it "redirects to 404" do
        content_page = create(:content_page)
        get content_page_url(content_page)
        expect(response).to redirect_to("/404")
      end
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_content_page_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      content_page = ContentPage.create! valid_attributes
      get edit_content_page_url(content_page)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ContentPage" do
        expect {
          post content_pages_url, params: { content_page: valid_attributes }
        }.to change(ContentPage, :count).by(1)
      end
      it "redirects to the created content_page" do
        post content_pages_url, params: { content_page: valid_attributes }
        expect(response).to redirect_to(versions_content_page_url(::ContentPage.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ContentPage" do
        expect {
          post content_pages_url, params: { content_page: invalid_attributes }
        }.not_to change(ContentPage, :count)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post content_pages_url, params: { content_page: invalid_attributes }
        expect(response).to be_successful
      end
    end

    context "with invalid user" do
      before { sign_in create(:user) }
      subject { post content_pages_url, params: { content_page: valid_attributes } }

      it "renders form" do
        subject
        expect(response).to be_successful
      end

      it "does not create content page" do
        expect { subject }.not_to change(ContentPage, :count)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_title) { Faker::Lorem.word }
      let(:content_page) { ContentPage.create! valid_attributes.merge(title: new_title) }

      it "updates the requested content_page" do
        patch content_page_url(content_page), params: { content_page: valid_attributes }
        content_page.reload
        expect(content_page.title).to eq(new_title)
      end

      it "redirects to the content_page versions" do
        patch content_page_url(content_page), params: { content_page: valid_attributes }
        content_page.reload
        expect(response).to redirect_to(versions_content_page_url(content_page))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        content_page = ContentPage.create! valid_attributes
        patch content_page_url(content_page), params: { content_page: invalid_attributes }
        expect(response).to be_successful
      end
    end

    context "with invalid user" do
      let(:content_page) { create :content_page }
      before { sign_in create(:user) }

      subject { patch content_page_url(content_page), params: { content_page: valid_attributes } }

      it "renders form" do
        subject
        expect(response).to be_successful
      end

      it "does not modify content page" do
        expect { subject }.not_to(change { content_page.reload })
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested content_page" do
      content_page = ContentPage.create! valid_attributes
      expect {
        delete content_page_url(content_page)
      }.to change(ContentPage, :count).by(-1)
    end

    it "redirects to the content_pages list" do
      content_page = ContentPage.create! valid_attributes
      delete content_page_url(content_page)
      expect(response).to redirect_to(content_pages_url)
    end
  end

  describe "Previewing markdown" do
    let(:valid_params) do
      {
        markdown: "## Govspeak is magic!",
      }
    end

    context "without a valid session" do
      it "redirects to login" do
        Warden.test_reset!
        post "/cms/preview_markdown", params: valid_params
        expect(response).to redirect_to("/users/sign_in")
      end
    end

    context "with a valid session" do
      it "renders a successful response" do
        sign_in create(:editor)
        post "/cms/preview_markdown", params: valid_params
        expect(response.content_type).to eq "application/json; charset=utf-8"
        expect(JSON.parse(response.body)).to have_key("html")
        expect(response).to be_successful
      end

      it "returns valid html" do
        sign_in create(:editor)
        post "/cms/preview_markdown", params: valid_params
        expect(JSON.parse(response.body)["html"]).to include('<h2 id="govspeak-is-magic">Govspeak is magic!</h2>')
      end
    end
  end

  describe "POST /cms/pages/:id/unpublish" do
    let!(:content_page) { create :content_page, :published }
    subject { post unpublish_content_page_path(content_page) }

    it "changes is published to false" do
      expect { subject }.to(change { content_page.reload.is_published }.to(false))
    end

    it "creates a content page version" do
      expect { subject }.to change(ContentPageVersion, :count).by(1)
    end
  end
end
