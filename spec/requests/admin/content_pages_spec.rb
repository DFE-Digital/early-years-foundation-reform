require "rails_helper"

RSpec.describe Admin::ContentPagesController, type: :request do
  # ContentPage. As you add validations to ContentPage, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) { attributes_for(:content_page) }
  let(:other_valid_attributes) { attributes_for(:content_page) }
  let(:invalid_attributes) { attributes_for(:content_page, :invalid_title) }
  let(:editor) { create(:editor) }

  before(:each) do
    sign_in editor
  end

  describe "GET /index" do
    it "renders a successful response" do
      parent_page = create(:content_page)
      child_page = create(:content_page)

      get admin_content_pages_path
      expect(response).to be_successful
      expect(response.body).to include(parent_page.title)
      expect(response.body).to include(child_page.title)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      content_page = create(:content_page, :published)
      get admin_content_page_path(content_page)
      expect(response).to be_successful
    end

    context "with an unpublished content page" do
      it "redirects to 404" do
        content_page = create(:content_page)
        get admin_content_page_path(content_page)
        expect(response).to redirect_to("/404")
      end
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_content_page_path
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      content_page = ContentPage.create! valid_attributes
      get edit_admin_content_page_path(content_page)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      subject { post admin_content_pages_path, params: { content_page: valid_attributes } }
      it "creates a new ContentPage" do
        expect { subject }.to change(ContentPage, :count).by(1)
      end

      it "populates content page from input" do
        subject
        content_page = ContentPage.last
        expect(content_page.title).to eq(valid_attributes[:title])
        expect(content_page.markdown).to eq(valid_attributes[:markdown])
        expect(content_page.description).to eq(valid_attributes[:description])
      end

      it "creates a new content page version" do
        expect { subject }.to change(ContentPageVersion, :count).by(1)
      end

      it "populates content page version from input" do
        subject
        content_page_version = ContentPageVersion.last
        expect(content_page_version.title).to eq(valid_attributes[:title])
        expect(content_page_version.markdown).to eq(valid_attributes[:markdown])
        expect(content_page_version.description).to eq(valid_attributes[:description])
      end

      it "redirects to the created content_page" do
        subject
        expect(response).to redirect_to(versions_admin_content_page_path(::ContentPage.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ContentPage" do
        expect {
          post admin_content_pages_path, params: { content_page: invalid_attributes }
        }.not_to change(ContentPage, :count)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admin_content_pages_path, params: { content_page: invalid_attributes }
        expect(response).to be_successful
      end
    end

    context "with invalid user" do
      before { sign_in create(:user) }
      subject { post admin_content_pages_path, params: { content_page: valid_attributes } }

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
    let!(:content_page) { create :content_page }
    context "with valid parameters" do
      let(:params) do
        { content_page: valid_attributes }
      end

      it "creates a new content_page_version" do
        expect { patch admin_content_page_path(content_page), params: params }.to change(ContentPageVersion, :count).by(1)
      end

      it "populates content page version from input" do
        patch admin_content_page_path(content_page), params: params
        content_page_version = content_page.content_page_versions.last
        expect(content_page_version.title).to eq(valid_attributes[:title])
        expect(content_page_version.description).to eq(valid_attributes[:description])
        expect(content_page_version.markdown).to eq(valid_attributes[:markdown])
        expect(content_page_version.author).to eq(editor.name)
      end

      it "redirects to the content_page versions" do
        patch admin_content_page_path(content_page), params: params
        expect(response).to redirect_to(versions_admin_content_page_path(content_page))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        content_page = ContentPage.create! valid_attributes
        patch admin_content_page_path(content_page), params: { content_page: invalid_attributes }
        expect(response).to be_successful
      end
    end

    context "with invalid user" do
      before { sign_in create(:user) }

      subject { patch admin_content_page_path(content_page), params: { content_page: valid_attributes } }

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
        delete admin_content_page_path(content_page)
      }.to change(ContentPage, :count).by(-1)
    end

    it "redirects to the content_pages list" do
      content_page = ContentPage.create! valid_attributes
      delete admin_content_page_path(content_page)
      expect(response).to redirect_to(admin_content_pages_path)
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
        post "/admin/preview_markdown", params: valid_params
        expect(response).to redirect_to("/users/sign_in")
      end
    end

    context "with a valid session" do
      it "renders a successful response" do
        sign_in create(:editor)
        post "/admin/preview_markdown", params: valid_params
        expect(response.content_type).to eq "application/json; charset=utf-8"
        expect(JSON.parse(response.body)).to have_key("html")
        expect(response).to be_successful
      end

      it "returns valid html" do
        sign_in create(:editor)
        post "/admin/preview_markdown", params: valid_params
        expect(JSON.parse(response.body)["html"]).to include('<h2 id="govspeak-is-magic">Govspeak is magic!</h2>')
      end
    end
  end

  describe "POST /admin/pages/:id/unpublish" do
    let!(:content_page) { create :content_page, :published }
    subject { post unpublish_admin_content_page_path(content_page) }

    it "changes is published to false" do
      expect { subject }.to(change { content_page.reload.is_published }.to(false))
    end

    it "creates a content page version" do
      expect { subject }.to change(ContentPageVersion, :count).by(1)
    end
  end
end
