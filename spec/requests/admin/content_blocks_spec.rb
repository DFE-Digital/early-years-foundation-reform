require "rails_helper"

RSpec.describe Admin::ContentBlocksController, type: :request do
  before { sign_in create(:admin) }

  describe "GET /cms/blocks" do
    it "renders page" do
      get admin_content_blocks_path
      expect(response).to be_successful
    end
  end

  describe "GET /cms/blocks/new" do
    it "renders page" do
      get new_admin_content_block_path
      expect(response).to be_successful
    end
  end

  describe "GET /cms/blocks/:id/edit" do
    let(:content_block) { create :content_block }
    it "renders page" do
      get edit_admin_content_block_path(content_block)
      expect(response).to be_successful
    end
  end

  describe "POST /cms/blocks" do
    let(:params) do
      { content_block: attributes_for(:content_block) }
    end
    subject { post admin_content_blocks_path, params: params }

    it "creates a new content block" do
      expect { subject }.to change(ContentBlock, :count).by(1)
    end

    it "redirects to index" do
      subject
      expect(response).to redirect_to(admin_content_blocks_path)
    end

    context "with invalid input" do
      let(:params) do
        { content_block: attributes_for(:content_block).slice(:description, :markdown) }
      end

      it "does not create a new content block" do
        expect { subject }.not_to change(ContentBlock, :count)
      end

      it "renders form again" do
        subject
        expect(response).to be_successful
      end
    end

    context "with invalid user" do
      before { sign_in create(:user) }

      it "does not create a new content block" do
        expect { subject }.not_to change(ContentBlock, :count)
      end

      it "renders form again" do
        subject
        expect(response).to be_successful
      end

      it "displays message" do
        subject
        expect(unescaped_response_body).to include("You don't have permission")
      end
    end
  end

  describe "PATCH /cms/blocks/:id" do
    let(:content_block) { create :content_block }
    let(:name) { Faker::Superhero.name.delete(" ") }
    let(:params) do
      { content_block: { name: name } }
    end
    subject { patch content_block_path(content_block), params: params }

    it "updates the content block" do
      original_name = content_block.name
      expect { subject }.to(change { content_block.reload.name }.from(original_name).to(name))
    end

    it "redirects to index" do
      subject
      expect(response).to redirect_to(admin_content_blocks_path)
    end

    context "with invalid input" do
      let(:name) { "" }

      it "does not update the content block" do
        expect { subject }.not_to(change { content_block.reload.name })
      end

      it "renders form again" do
        subject
        expect(response).to be_successful
      end
    end

    context "with invalid user" do
      before { sign_in create(:user) }

      it "does not update the content block" do
        expect { subject }.not_to(change { content_block.reload.name })
      end

      it "renders form again" do
        subject
        expect(response).to be_successful
      end

      it "displays message" do
        subject
        expect(unescaped_response_body).to include("You don't have permission")
      end
    end
  end
end
