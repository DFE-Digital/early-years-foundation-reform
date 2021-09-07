class ApplicationController < ActionController::Base
  before_action { cookies.delete :track_google_analytics }
  before_action do |_controller|
    @page = OpenStruct.new(title: t(params[:action], default: params[:action].humanize, scope: params[:controller].parameterize))
  end

  include Pundit

  def check
    logger.info "Inside check"
    render json: { status: "OK", version: ENV["SHA"], environment: Rails.env }, status: :ok
  end

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end
end
