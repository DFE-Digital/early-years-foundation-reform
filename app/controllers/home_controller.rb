class HomeController < ApplicationController
  helper_method :section,
                :page

  def index; end

private

  # @return [Page]
  def page
    Page.home
  end

  # @return [String]
  def section
    page.slug
  end
end
