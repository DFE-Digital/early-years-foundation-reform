require "rails_helper"

RSpec.describe ContentPage, type: :model do
  it "only allows alphanumeric and spaces in the title" do
    attributes_for_page = FactoryBot.attributes_for(:content_page, :with_special_chars_in_title)

    page = ContentPage.new(attributes_for_page)
    expect { page.save! }.to raise_exception(/Title should only contain alphabet, numeric and space characters/)
  end

  it "sets the slug from the title, converting spaces to hyphens" do
    page = FactoryBot.create(:content_page)
    saved_page = ContentPage.find_by_title page.title

    expect { saved_page == saved_page.downcase.gsub(/ /, "-") }
  end
end
