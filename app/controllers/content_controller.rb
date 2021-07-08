class ContentController < ApplicationController
  before_action :authenticate_user!, if: proc { !ENV["AUTH_ON_EVERYTHING"].nil? }
  after_action :set_cache_headers

  def set_cache_headers
    response.headers["Cache-Control"] = "max-age=3600, public"
  end

  # GET /page_title
  def show
    begin
      @page = ContentPage.find_by_slug!(params["slug"])
    rescue ActiveRecord::RecordNotFound
      not_found
    end

    if @page.parent && (params["section"] != @page.parent.slug)
      return not_found
    end

    @markdown = GovspeakToHTML.new.translate_markdown(@page.markdown)
    @page
  end

  # GET /
  def index
    # Don't show featured pages in the cards
    @content_pages = ContentPage.top_level.order_by_position - ContentPage.featured_pages

    respond_to do |format|
      format.html { render layout: "landing_page_layout" }
    end
  end

private

  def content_params
    params.require(:content_page).permit(:section, :slug)
  end
end
