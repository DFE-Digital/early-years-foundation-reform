require 'rails_helper'

RSpec.describe "content_pages/new", type: :view do
  before(:each) do
    assign(:content_page, ContentPage.new(
      title: "MyString",
      slug: "MyString",
      markdown: "MyString",
      seo: "MyString"
    ))
  end

  it "renders new content_page form" do
    render

    assert_select "form[action=?][method=?]", content_pages_path, "post" do

      # TODO The input names should be nexted in content_page, for example
      # assert_select "input[name=?]", "content_page[title]"
      # See controller
      #
      assert_select "input[name=?]", "title"

      assert_select "textarea[name=?]", "subtitle"

      assert_select "input[name=?]", "slug"

      assert_select "textarea[name=?]", "markdown"

      assert_select "input[name=?]", "seo"
    end
  end
end
