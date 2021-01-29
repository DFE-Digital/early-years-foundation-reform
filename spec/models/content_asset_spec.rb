require "rails_helper"

RSpec.describe ContentAsset, type: :model do
  describe "with an attached file" do
    subject { ContentAsset.new }

    before(:each) do
      subject.title = "Title"
      subject.avatar.attach(io: File.open("spec/fixtures/sample.jpeg"), filename: "sample.jpeg", content_type: "image/jpeg")
      subject.save!
    end

    it "has a file attached" do
      expect(subject.avatar).to be_attached
    end
  end

  describe "required attributes" do
    subject { ContentAsset.new }
    it "requires a title" do
      subject.validate
      expect(subject.errors[:title]).to include("can't be blank")
    end
    it "requires an asset to be uploaded" do
      subject.validate
      expect(subject.errors[:avatar]).to include("can't be blank")
    end
  end
end
