require 'rails_helper'

RSpec.describe "content_pages/show", type: :view do
  before(:each) do
    @content_page = assign(:content_page, ContentPage.create!(
      title: "Title",
      slug: "Slug",
      markdown: "Markdown",
      seo: "Seo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/Markdown/)
    expect(rendered).to match(/Seo/)
  end
end
