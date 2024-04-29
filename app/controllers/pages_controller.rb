class PagesController < ApplicationController
  helper_method :page,
                :slug,
                :section,
                :breadcrumbs
  layout 'hero'

  def index
    render 'errors/not_found', layout: 'application' if page.nil?
  end

  def show
    if page.nil?
      render 'errors/not_found', layout: 'application'
    else
      render page.to_partial_path
    end
  end

private

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
