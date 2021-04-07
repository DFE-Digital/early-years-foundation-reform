class StaticPagesController < ApplicationController
  layout "errors"

  def show;
    render template: "static_pages/#{params[:title]}"
  end
end
