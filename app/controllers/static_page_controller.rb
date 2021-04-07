class StaticPageController < ApplicationController
    layout "static_pages"
  
    def show; 
        render template: "static_pages/#{params[:title]}"
    end

end
  