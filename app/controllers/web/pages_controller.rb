module Web
  class PagesController < ApplicationController
    before_action { page }

    helper_method :page, :slug, :section, :breadcrumbs

    def index; end

    def show
      render page.page_style.underscore
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
      Web::Page.by_slug(lookup_slug)
    end
  end
end
