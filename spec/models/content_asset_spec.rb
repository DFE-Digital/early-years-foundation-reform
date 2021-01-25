require 'rails_helper'

RSpec.describe ContentAsset, type: :model do

  describe "with a valid file" do

    before(:each) do
      @content_asset = ContentAsset.new(title: "test title")
      @content_asset.avatar.attach(
        io: File.open(Rails.root.join("spec/fixtures/sample.jpeg")),
        filename: 'sample.jpeg',
        content_type: 'image/jpeg',
      )
      @content_asset.save!
    end

    it "has a file attached" do
      expect(@content_asset.avatar).to be_attached
    end

  end

  describe "required attributes" do

    it "requires a title and a avatar(file)" do
      record = ContentAsset.new
      record.title = ""
      record.validate
      expect(record.errors[:title]).to include("can't be blank")

    end
  end

end

