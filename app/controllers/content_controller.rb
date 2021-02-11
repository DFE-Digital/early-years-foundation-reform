class ContentController < ApplicationController
  layout "content"

  # GET /content/page_title
  def show
    @page = ContentPage.find_by_slug params["slug"]

    doc = Govspeak::Document.new @page.markdown
    @markdown = doc.to_html
    @page
  end

  # GET /content
  def index
    @content_pages = ContentPage.top_level.order_by_position

    respond_to do |format|
      format.html { render layout: "landing_page_layout" }
    end
  end
end
