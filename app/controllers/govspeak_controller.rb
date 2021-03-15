class GovspeakController < ApplicationController
  before_action :authenticate_user!

  require "govspeak"

  def show
    Rails.logger.silence do
      html = GovspeakToHTML.new.translate_markdown(params["input"])

      render json: { html: html }
    end
  end
end
