class HomeController < ApplicationController
  helper_method :section,
                :page
  layout 'hero'

  def index
    return if page

    render 'errors/service_unavailable', layout: 'application', status: :service_unavailable
  end

private

  # @return [Page]
  def page
    return @page if defined?(@page)

    @page = Page.home
  end

  # @return [String]
  def section
    page&.slug.to_s
  end
end
