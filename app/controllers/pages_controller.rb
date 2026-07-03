class PagesController < ApplicationController
  helper_method :page,
                :slug,
                :section,
                :breadcrumbs
  layout 'hero'

  def index
    render_not_found if page.nil?
  end

  def show
    if page.nil?
      render_not_found
    else
      render page.to_partial_path
    end
  end

private

  def render_not_found
    render 'errors/not_found', layout: 'application', status: :not_found, formats: [:html]
  end

  def breadcrumbs
    page.breadcrumbs
  end

  def page_params
    params.permit(:section, :overview, :slug)
  end

  def slug
    page_params[:slug]
  end

  def section
    page_params[:section]
  end

  def lookup_slug
    slug.presence || section
  end

  def page
    Page.by_slug(lookup_slug)
  end
end
