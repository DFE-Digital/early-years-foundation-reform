class GovspeakController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  require "govspeak"

  def show
    doc = Govspeak::Document.new params[:input]
    render json: { html: doc.to_html }
  end
end
