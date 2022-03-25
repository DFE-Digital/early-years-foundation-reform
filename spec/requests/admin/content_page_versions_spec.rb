require "rails_helper"

RSpec.describe Admin::ContentPageVersionsController, type: :request do
  let!(:content_page_version) { create :content_page_version }
  let(:content_page) { content_page_version.content_page }

  before { sign_in create(:admin) }

  describe "GET /admin/pages/:content_page_id/content_page_versions/:id/preview_of_draft" do
    it "renders successfully" do
      get preview_of_draft_admin_content_page_content_page_version_path(content_page, content_page_version)
      expect(response).to be_successful
    end
  end

  describe "POST /admin/pages/:content_page_id/content_page_versions/:id/publish" do
    subject { post publish_admin_content_page_content_page_version_path(content_page, content_page_version) }

    it "deletes content page version" do
      expect { subject }.to change(ContentPageVersion, :count).by(-1)
      expect(ContentPageVersion.exists?(content_page_version.id)).to be(false)
    end

    it "updates the content page with data from content page version" do
      original_title = content_page.title
      expect { subject }.to(change { content_page.reload.title }.from(original_title).to(content_page_version.title))
      expect(content_page.reload.content_list).to eq(content_page_version.content_list)
      expect(content_page.reload.markdown).to eq(content_page_version.markdown)
      expect(content_page.reload.description).to eq(content_page_version.description)
    end

    it "set the content page as published" do
      subject
      expect(content_page.reload.is_published).to be(true)
    end

    it "redirects to version content page" do
      expect(subject).to redirect_to(versions_admin_content_page_path(content_page))
    end
  end

  describe "GET /admin/pages/:content_page_id/content_page_versions/:id/edit" do
    it "renders successfully" do
      get edit_admin_content_page_content_page_version_path(content_page, content_page_version)
      expect(response).to be_successful
    end
  end

  describe "PATCH /admin/pages/:content_page_id/content_page_versions/:id" do
    let(:params) do
      {
        content_page_version: attributes_for(:content_page_version),
      }
    end
    subject { patch admin_content_page_content_page_version_path(content_page, content_page_version), params: params }

    it "updates the content page version" do
      subject
      expect(content_page_version.reload.markdown).to eq(params.dig(:content_page_version, :markdown))
    end

    it "redirects to version content page" do
      expect(subject).to redirect_to(versions_admin_content_page_path(content_page))
    end

    context "with invalid input" do
      let(:params) { { content_page_version: { title: "Invalid!" } } }
      it "renders the form again" do
        subject
        expect(response).to be_successful
      end

      it "does not update the content page version" do
        expect { subject }.not_to(change { content_page_version.reload.title })
      end
    end

    context "with standard user" do
      before { sign_in create(:user) }

      it "renders the form again" do
        subject
        expect(response).to be_successful
      end

      it "displays a message" do
        subject
        expect(unescaped_response_body).to include("You don't have permission")
      end

      it "does not update the content page version" do
        expect { subject }.not_to(change { content_page_version.reload.title })
      end
    end
  end

  describe "DELETE /admin/pages/:content_page_id/content_page_versions/:id" do
    before do
      # Ensure only one content_page_version associated with content page
      content_page.content_page_versions.first.destroy! if content_page.content_page_versions.count == 2
    end

    subject { delete admin_content_page_content_page_version_path(content_page, content_page_version) }

    it "deletes the content page version" do
      expect { subject }.to change(ContentPageVersion, :count).by(-1)
    end

    it "deletes the content page" do
      expect { subject }.to change(ContentPage, :count).by(-1)
    end

    context "when content page published" do
      before { content_page.update is_published: true }

      it "deletes the content page version" do
        expect { subject }.to change(ContentPageVersion, :count).by(-1)
      end

      it "does not delete the content page" do
        expect { subject }.not_to change(ContentPage, :count)
      end
    end
  end
end
