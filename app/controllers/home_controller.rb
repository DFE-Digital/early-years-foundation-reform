class HomeController < ApplicationController
  before_action :authenticate_user!, if: proc { !ENV["AUTH_ON_EVERYTHING"].nil? }

  def index
    @page = Web::Page.home
  end
end
