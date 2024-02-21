class HomeController < ApplicationController
  before_action :authenticate_user!, if: proc { !ENV["AUTH_ON_EVERYTHING"].nil? }

  helper_method :section

  def index
    @pages = Web::Page.search(placement: 'home').load
  end

private

  def section
    'home'
  end
end
