module Admin
  class AdminController < ApplicationController
    layout "beta/cms"
    before_action :authenticate_user!
  end
end
