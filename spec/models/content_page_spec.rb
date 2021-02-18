require "rails_helper"

RSpec.describe ContentPage, type: :model do
  let(:expected_exception_message) do
    /should only contain alphabetic, numeric, comma, fullstop, hyphen and space characters/
  end

  it "only allows alphanumeric and spaces in the title" do
    attributes_for_page = FactoryBot.attributes_for(:content_page, :with_special_chars_in_title)

    page = ContentPage.new(attributes_for_page)
    expect { page.save! }.to raise_exception(expected_exception_message)
  end

  it "sets the slug from the title, converting spaces to hyphens" do
    page = FactoryBot.create(:content_page)

    expect { page.save! }.to_not raise_error
  end

  it "sets the slug from the title, removing commas" do
    page = FactoryBot.create(:content_page, :comma_in_title)

    expect { page.save! }.to_not raise_error
  end

  it "sets the slug from the title, removing fullstops" do
    page = FactoryBot.create(:content_page, :fullstop_in_title)

    expect { page.save! }.to_not raise_error
  end

  it "sets the slug from the title, preserving hyphens" do
    page = FactoryBot.create(:content_page, :two_hyphens_and_a_space_in_title)

    expect { page.save! }.to_not raise_error

    saved_page = ContentPage.find_by_title page.title
    expect(saved_page.slug.count("-")).to be(3)
    expect(saved_page.title.count("-")).to be(2)
  end
end
