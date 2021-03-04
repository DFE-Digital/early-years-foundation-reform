require "rails_helper"

RSpec.describe "content_pages/new", type: :view do
  before(:each) do
    assign(:content_page, ContentPage.new(
                            title: "MyString",
                            markdown: "MyString",
                          ))
  end

  it "renders new content_page form" do
    render

    assert_select "form[action=?][method=?]", content_pages_path, "post" do
      assert_select "input[name=?]", "content_page[title]"

      assert_select "textarea[name=?]", "content_page[markdown]"
    end
  end
end
