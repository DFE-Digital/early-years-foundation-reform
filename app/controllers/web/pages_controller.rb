module Web
  class PagesController < ApplicationController
    before_action { load_page }

    helper_method :breadcrumbs

    def show; end

  private

    def menu_item
      cms_path_array.first
    end

    def page_params
      params.permit(:cms_path, :slug)
    end

    def page(page_name)
      content.send(page_name)
    end

    def breadcrumbs
      if cms_path == "/"
        {}
      else
        cms_path_array.each_with_object({ "Home" => "/" }) do |obj, memo|
          page = load_page(lookup_page: obj.to_sym)
          memo[page.menu_title] = page.full_path
        end
      end
    end

    def cms_path
      page_params[:cms_path] || "/"
    end

    def cms_path_array
      cms_path&.split("/")
    end

    def load_page
      @page = Web::Page.by_slug(page_params[:slug])
    end
  end
end