class ContentController < ApplicationController
  layout "content"

  # GET /content/page_title
  def show
    @page = ContentPage.find_by_slug params["slug"]

    doc = Govspeak::Document.new @page.markdown
    @markdown = doc.to_html
    @page
  end
end
