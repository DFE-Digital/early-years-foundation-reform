class GovspeakController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  require "govspeak"

  def show
    Rails.logger.silence do
      html = MarkdownToHtml.new.translate_markdown(params["input"])

      render json: { html: html }
    end
  end
end
