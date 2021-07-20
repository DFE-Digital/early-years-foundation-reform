class ContentController < ApplicationController
  before_action :authenticate_user!, if: proc { !ENV["AUTH_ON_EVERYTHING"].nil? }
  after_action :set_cache_headers

  def set_cache_headers
    response.headers["Cache-Control"] = "max-age=3600, public" if cookies[:track_analytics].present?
  end

  # This is a page whose title and children's titles are rendered
  # a block in the landing_page_layout template
  FEATURED_PAGE_TITLE = "Get help to improve your practice".freeze

  # GET /page_title
  def show
    @page = ContentPage.find_by_slug!(params["slug"])
    @markdown = GovspeakToHTML.new.translate_markdown(@page.markdown)

    # If page has parent, it must be a child of existing page
    if @page.parent && params["section"].present?
      not_found unless @page.parent.slug == params["section"] 
    end
  rescue
    not_found
  end

  # GET /
  def index
    @featured_page = ContentPage.find_by_title FEATURED_PAGE_TITLE
    # Don't show featured pages in the cards
    @content_pages = ContentPage.top_level.order_by_position - [@featured_page]

    respond_to do |format|
      format.html { render layout: "landing_page_layout" }
    end
  end
end
