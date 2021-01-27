require "rails_helper"

RSpec.describe ContentAsset, type: :model do
  describe "with an attached file" do
    before(:each) do
      @content_asset = ContentAsset.new(title: "Title")
      @content_asset.avatar.attach(io: File.open("spec/fixtures/sample.jpeg"), filename: "sample.jpeg", content_type: "image/jpeg")
      @content_asset.save!
    end

    it "has a file attached" do
      expect(@content_asset.avatar).to be_attached
    end
  end

  describe "required attributes" do
    it "requires a title" do
      record = ContentAsset.new
      record.validate
      puts "content asset attributes hash: #{record.errors.inspect}"
      expect(record.errors[:title]).to include("can't be blank")
    end
    it "requires an asset to be uploaded" do
      record = ContentAsset.new
      record.validate
      puts "content asset attributes hash: #{record.errors.inspect}"
      expect(record.errors[:avatar]).to include("can't be blank")
    end
  end
end
