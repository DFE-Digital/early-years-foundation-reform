require "rails_helper"

RSpec.describe "content_pages/edit", type: :view do
  before(:each) do
    @content_page = FactoryBot.create(:content_page)
  end

  it "renders the edit content_page form" do
    render

    assert_select "form[action=?][method=?]", content_page_path(@content_page), "post" do
      assert_select "input[name=?]", "content_page[title]"

      assert_select "textarea[name=?]", "content_page[markdown]"
    end
  end
end
