require "rails_helper"

RSpec.describe Feature do
  describe ".enabled?" do
    it "returns true" do
      expect(described_class.enabled?(:something)).to be(true)
    end

    context "with :supported_articles" do
      it "returns true in test environment" do
        expect(described_class.enabled?(:support_articles)).to be(true)
      end

      it "returns false in production environment" do
        allow(Rails.env).to receive(:production?).and_return(true)
        expect(described_class.enabled?(:support_articles)).to be(false)
      end
    end
  end
end
