require "rails_helper"

RSpec.describe ContentAssetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: content_assets_path).to route_to("content_assets#index")
    end

    it "routes to #new" do
      expect(get: new_content_asset_path).to route_to("content_assets#new")
    end

    it "routes to #show" do
      expect(get: content_assets_path + "/1").to route_to("content_assets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: content_assets_path + "/1/edit").to route_to("content_assets#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: content_assets_path).to route_to("content_assets#create")
    end

    it "routes to #update via PUT" do
      expect(put: content_assets_path + "/1").to route_to("content_assets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: content_assets_path + "/1").to route_to("content_assets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: content_assets_path + "/1").to route_to("content_assets#destroy", id: "1")
    end
  end
end
