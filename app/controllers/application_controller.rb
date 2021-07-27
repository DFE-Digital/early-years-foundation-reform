class ApplicationController < ActionController::Base
  before_action { cookies.delete :track_google_analytics }
  before_action do |_controller|
    @page = OpenStruct.new(title: t(params[:action], default: params[:action].humanize, scope: params[:controller].parameterize))
  end

  include Pundit

  def flipper_session_id
    session[FlipperSession.session_key] ||= FlipperSession.generate_id
  end
  helper_method :flipper_session_id

  def flipper_session
    @flipper_session ||= FlipperSession.new(flipper_session_id)
  end
  helper_method :flipper_session

  def check
    render json: { status: "OK", version: ENV["SHA"], environment: Rails.env }, status: :ok
  end

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end
end
