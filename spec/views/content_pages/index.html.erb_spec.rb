require "rails_helper"

RSpec.describe "content_pages/index", type: :view do
  before(:each) do
    @content_pages = [
      FactoryBot.create(:content_page),
      FactoryBot.create(:content_page),
    ]
  end

  it "renders a list of content_pages" do
    render
    @content_pages.each do |funky_page|
      rendered.include? funky_page.title
      rendered.include? funky_page.markdown
    end
  end
end
