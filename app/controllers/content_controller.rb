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

    # If in a section page and page has parent, it must be a child of existing page
    not_found if content_section? && params["section"] != parent_slug
  rescue ActiveRecord::RecordNotFound
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

private

  def parent_slug
    @page.parent && @page.parent.slug
  end

  def content_section?
    params["section"].present?
  end
end
