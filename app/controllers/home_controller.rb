class HomeController < ApplicationController
  before_action :authenticate_user!, if: proc { !ENV['AUTH_ON_EVERYTHING'].nil? }

  helper_method :section, :page

  def index; end

private

  def page
    Web::Page.home
  end

  def section
    'home'
  end
end
