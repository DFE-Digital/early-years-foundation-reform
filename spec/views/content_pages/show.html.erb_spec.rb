require "rails_helper"

RSpec.describe "content_pages/show", type: :view do
  before(:each) do
    @content_page = FactoryBot.create(:content_page)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to include(@content_page.title)
    expect(rendered).to include(@content_page.markdown)
  end
end
