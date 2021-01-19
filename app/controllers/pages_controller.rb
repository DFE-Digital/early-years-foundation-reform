class PagesController < ApplicationController
  def show
    render template: "pages/home"
  end
end
