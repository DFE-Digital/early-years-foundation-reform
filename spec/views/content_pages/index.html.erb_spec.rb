require 'rails_helper'

RSpec.describe "content_pages/index", type: :view do
  before(:each) do
    assign(:content_pages, [
      ContentPage.create!(
        title: "Title",
        slug: "Slug",
        markdown: "Markdown",
        seo: "Seo"
      ),
      ContentPage.create!(
        title: "Title",
        slug: "Slug",
        markdown: "Markdown",
        seo: "Seo"
      )
    ])
  end

  it "renders a list of content_pages" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Slug".to_s, count: 2
    assert_select "tr>td", text: "Markdown".to_s, count: 2
    assert_select "tr>td", text: "Seo".to_s, count: 2
  end
end
