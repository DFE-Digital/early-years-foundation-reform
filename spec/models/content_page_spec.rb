require "rails_helper"

RSpec.describe ContentPage, type: :model do
  it "only allows alphanumeric and spaces in the title" do
    attributes_for_page = FactoryBot.attributes_for(:content_page, :with_special_chars_in_title)

    page = ContentPage.new(attributes_for_page)
    expect { page.save! }.to raise_exception(/Title Title should only contain alphabet, numeric and space characters/)
  end
end
