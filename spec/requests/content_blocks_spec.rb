require "rails_helper"

RSpec.describe "/content_blocks", type: :request do

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

  describe "GET /cms/blocks" do
    it "renders a successful response" do
      parent_page = FactoryBot.create(:content_page)
      child_page = FactoryBot.create(:content_page)

      get content_pages_url
      expect(response).to be_successful
      expect(response.body).to include(parent_page.title)
      expect(response.body).to include(child_page.title)
    end
  end
end
