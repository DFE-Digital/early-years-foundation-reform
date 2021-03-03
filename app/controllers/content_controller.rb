class ContentController < ApplicationController
  layout "content"

  ALLOWED_TAGS = %w[details summary p h1 h2 h3 h4 ul li img div ol a span].freeze

  # GET /content/page_title
  def show
    @page = ContentPage.find_by_slug params["slug"]
    
    doc = Govspeak::Document.new(@page.markdown, sanitize: true, allowed_elements: ContentController::ALLOWED_TAGS)
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
