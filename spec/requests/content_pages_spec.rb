require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/content_pages", type: :request do
  # ContentPage. As you add validations to ContentPage, be sure to
  # adjust the attributes here as well.

  let(:valid_attributes) do
    FactoryBot.attributes_for(:content_page)
  end

  let(:other_valid_attributes) do
    FactoryBot.attributes_for(:content_page)
  end

  let(:invalid_attributes) do
    skip("Add a hash of attributes invalid for your model")
  end

  before(:each) do
    sign_in FactoryBot.create(:editor)
  end

  describe "GET /index" do
    it "renders a successful response" do
      parent_page = FactoryBot.create(:content_page)
      child_page = FactoryBot.create(:content_page)

      get content_pages_url
      expect(response).to be_successful
      expect(response.body).to include(parent_page.title)
      expect(response.body).to include(child_page.title)
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      content_page = ContentPage.create! valid_attributes
      get content_page_url(content_page)
      expect(response).to be_successful
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
        expect(response).to redirect_to(content_page_url(::ContentPage.last))
      end
      it "prevents pages from having duplicate titles (and therefore slugs)" do
        post content_pages_url, params: { content_page: valid_attributes }

        other_valid_attributes[:title] = valid_attributes[:title]
        post content_pages_url, params: { content_page: other_valid_attributes }

        expect(response.body).to match(/Title has already been taken/)
      end
    end

    context "with invalid parameters" do
      it "does not create a new ContentPage" do
        expect {
          post content_pages_url, params: { content_page: invalid_attributes }
        }.to change(ContentPage, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post content_pages_url, params: { content_page: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested content_page" do
        content_page = ContentPage.create! valid_attributes
        patch content_page_url(content_page), params: { content_page: new_attributes }
        content_page.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the content_page" do
        content_page = ContentPage.create! valid_attributes
        patch content_page_url(content_page), params: { content_page: new_attributes }
        content_page.reload
        expect(response).to redirect_to(content_page_url(content_page))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        content_page = ContentPage.create! valid_attributes
        patch content_page_url(content_page), params: { content_page: invalid_attributes }
        expect(response).to be_successful
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
        sign_in FactoryBot.create(:editor, email: Faker::Internet.email)
        post "/cms/preview_markdown", params: valid_params
        expect(response.content_type).to eq "application/json; charset=utf-8"
        expect(JSON.parse(response.body)).to have_key("html")
        expect(response).to be_successful
      end

      it "returns valid html" do
        sign_in FactoryBot.create(:editor, email: Faker::Internet.email)
        post "/cms/preview_markdown", params: valid_params
        expect(JSON.parse(response.body)["html"]).to include('<h2 id="govspeak-is-magic">Govspeak is magic!</h2>')
      end
    end
  end
end
