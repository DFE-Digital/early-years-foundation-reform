require "rails_helper"

RSpec.describe Article, type: :model do
  describe "#image_file_ext_validation" do
    let(:image) { fixture_file_upload("sample.jpeg") }
    let(:text_file) { fixture_file_upload("sample.txt") }

    context "with valid files" do
      let(:article) { build :article, featured_image: image, thumbnail_image: image }
      it "does not block saving" do
        expect(article).to be_valid
      end
    end

    context "with invalid featured image" do
      let(:article) { build :article, featured_image: text_file, thumbnail_image: image }
      it "invalidates article" do
        expect(article).to be_invalid
      end
    end

    context "with invalid thumbnail image" do
      let(:article) { build :article, featured_image: image, thumbnail_image: text_file }
      it "invalidates article" do
        expect(article).to be_invalid
      end
    end
  end
end
