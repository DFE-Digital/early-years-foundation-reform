module Admin
  class AdminController < ApplicationController
    layout "cms"
    before_action :authenticate_user!
  end
end
