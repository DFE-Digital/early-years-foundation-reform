class GovspeakController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  require "govspeak"

  def show
    Rails.logger.silence do
      doc = Govspeak::Document.new params[:input], sanitize: true, allowed_elements: ContentController::ALLOWED_TAGS
      render json: { html: doc.to_html }
    end
  end
end
