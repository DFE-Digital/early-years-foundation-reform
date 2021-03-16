class GovspeakController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  require "govspeak"

  def show
    render json: { html: "<h1>Do not call me <h1>" }
  end
end
