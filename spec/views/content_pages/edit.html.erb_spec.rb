require 'rails_helper'

RSpec.describe "content_pages/edit", type: :view do
  before(:each) do
    @content_page = assign(:content_page, ContentPage.create!(
      title: "MyString",
      slug: "MyString",
      markdown: "MyString",
      seo: "MyString"
    ))
  end

  it "renders the edit content_page form" do
    render

    assert_select "form[action=?][method=?]", content_page_path(@content_page), "post" do

      assert_select "input[name=?]", "content_page[title]"

      assert_select "input[name=?]", "content_page[slug]"

      assert_select "input[name=?]", "content_page[markdown]"

      assert_select "input[name=?]", "content_page[seo]"
    end
  end
end
