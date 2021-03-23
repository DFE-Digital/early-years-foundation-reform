require "rails_helper"

RSpec.describe ContentAsset, type: :model do
  describe "with a valid attached file" do
    let(:content_asset) { ContentAsset.new }

    before(:each) do
      content_asset.title = "Title"
      content_asset.alt_text = "Sample Alt Text"
      content_asset.asset_file.attach(io: File.open("spec/fixtures/sample.jpeg"), filename: "sample.jpeg", content_type: "image/jpeg")
      content_asset.save!
    end

    it "has a file attached" do
      expect(content_asset.asset_file).to be_attached
    end

    %w[pdf doc docx xls xlsx png jpg jpeg PDF DOC DOCX XLS XLSX PNG JPG JPEG].each do |extension|
      it "has valid extension" do
        content_asset.asset_file.attach(io: File.open("spec/fixtures/sample.jpeg"), filename: "sample.#{extension}", content_type: "image/jpeg")
        content_asset.validate
        expect(content_asset).to be_valid
      end
    end

    %w[
      image/jpeg
      image/png
      application/pdf
      application/msword
      application/vnd.ms-excel
      application/vnd.openxmlformats-officedocument.spreadsheetml.sheet
      application/vnd.openxmlformats-officedocument.wordprocessingml.document
    ].each do |content_type|
      it "has valid content type" do
        content_asset.asset_file.attach(io: File.open("spec/fixtures/sample.jpeg"), filename: "sample.jpeg", content_type: content_type)
        content_asset.validate
        expect(content_asset).to be_valid
      end
    end
  end

  describe "invalid attributes" do
    let(:content_asset) { ContentAsset.new(title: "Title", alt_text: "Alternative Title") }
    it "needs a valid extension" do
      content_asset.asset_file.attach(io: File.open("spec/fixtures/sample.jpeg"), filename: "sample.xxx", content_type: "image/jpeg")
      content_asset.validate
      expect(content_asset.errors[:asset_file]).to include("invalid extension. Valid extensions are PDF, DOC, DOCX, XLS, XLSX, JPG, JPEG, PNG")
    end
  end

  describe "required attributes" do
    let(:content_asset) { ContentAsset.new }
    before(:each) do
      content_asset.validate
    end
    it "requires a title" do
      expect(content_asset.errors[:title]).to include("can't be blank")
    end
    it "requires an asset to be uploaded" do
      expect(content_asset.errors[:asset_file]).to include("can't be blank")
    end
    it "requires an alt text for the asset" do
      expect(content_asset.errors[:alt_text]).to include("can't be blank")
    end
  end
end
