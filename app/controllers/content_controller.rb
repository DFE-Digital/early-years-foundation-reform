class ContentController < ApplicationController
  layout "content"

  # This is a page whose title and children's titles are rendered in
  # a block in the landing_page_layout template
  FEATURED_PAGE_TITLE = "Get help to improve your practice".freeze

  ALLOWED_TAGS = %w[details summary p h1 h2 h3 h4 ul li img div ol a span].freeze

  # GET /page_title
  def show
    begin
      @page = ContentPage.find_by_slug!(params["slug"])
    rescue ActiveRecord::RecordNotFound
      not_found
    end

    if @page.parent
      if params["section"] != @page.parent.slug
        return not_found
      end
    end

    doc = Govspeak::Document.new(@page.markdown, sanitize: true, allowed_elements: ContentController::ALLOWED_TAGS)
    @markdown = doc.to_html
    @page
  end

  # GET /
  def index
    @content_pages = ContentPage.top_level.order_by_position
    @featured_page = ContentPage.find_by_title FEATURED_PAGE_TITLE

    respond_to do |format|
      format.html { render layout: "landing_page_layout" }
    end
  end

private

  def content_params
    params.require(:content_page).permit(:section, :slug)
  end
end