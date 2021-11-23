require "rails_helper"

RSpec.describe "content/index", type: :view do
  before(:each) do
    @content_pages = [
      FactoryBot.create(:content_page),
      FactoryBot.create(:content_page),
    ]
    @featured_pages = []
  end

  it "renders a list of content" do
    render
    @content_pages.each do |content|
      rendered.include? content.title
    end
  end

  it "should not contain the feedback section" do
    render
    expect(rendered).not_to include("Is this page useful?")
  end
end
