require "rails_helper"

RSpec.describe ContentAsset, type: :model do
  describe "with an attached file" do
    subject { ContentAsset.new }

    before(:each) do
      subject.title = "Title"
      subject.alt_text = "Sample Alt Text"
      subject.asset_file.attach(io: File.open("spec/fixtures/sample.jpeg"), filename: "sample.jpeg", content_type: "image/jpeg")
      subject.save!
    end

    it "has a file attached" do
      expect(subject.asset_file).to be_attached
    end
  end

  describe "required attributes" do
    subject { ContentAsset.new }
    before(:each) do
      subject.validate
    end
    it "requires a title" do
      expect(subject.errors[:title]).to include("can't be blank")
    end
    it "requires an asset to be uploaded" do
      expect(subject.errors[:asset_file]).to include("can't be blank")
    end
    it "requires an alt text for the asset" do
      expect(subject.errors[:alt_text]).to include("can't be blank")
    end
  end
end
