class ContentController < ApplicationController
  before_action :authenticate

  # There is a temporary need to put basic auth around the public pages
  # but it should be easy to turn off. So, if the env var is set, the
  # user should have a devise account. This does not log them in via
  # devise or Warden, it just satisfies Basic Auth
  def authenticate
    # rubocop is doing my head in
    # rubocop:disable Style/NegatedIf
    if !ENV["USE_BASIC_AUTH"]
      return true
    end

    # rubocop:enable Style/NegatedIf

    authenticate_or_request_with_http_basic do |username, password|
      user = User.find_by_email username
      if user && BCrypt::Password.new(user.encrypted_password) == password
        true
      else
        false
      end
    end
  end

  layout "content"
  # This is a page whose title and children's titles are rendered in
  # a block in the landing_page_layout template
  FEATURED_PAGE_TITLE = "Get help to improve your practice".freeze

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

    @markdown = GovspeakToHTML.new.translate_markdown(@page.markdown)
    @page
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

  def content_params
    params.require(:content_page).permit(:section, :slug)
  end
end
