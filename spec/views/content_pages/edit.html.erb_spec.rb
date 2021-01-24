require 'rails_helper'

RSpec.describe "content_pages/edit", type: :view do
  before(:each) do
    @content_page = FactoryBot.create(:content_page)
  end

  it "renders the edit content_page form" do
    render

    assert_select "form[action=?][method=?]", content_page_path(@content_page), "post" do

      # TODO The input names should be nexted in content_page, for example
      # assert_select "input[name=?]", "content_page[title]"
      # See controller
      assert_select "input[name=?]", "title"

      assert_select "input[name=?]", "slug"

      assert_select "textarea[name=?]", "markdown"

      assert_select "input[name=?]", "seo"
    end
  end
end
