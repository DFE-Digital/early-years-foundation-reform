class ApplicationController < ActionController::Base
  before_action { cookies.delete :track_google_analytics }
  before_action do |_controller|
    @page = OpenStruct.new(title: t(params[:action], default: params[:action].humanize, scope: params[:controller].parameterize))
  end

  include Pundit

  def check
    render json: { status: "OK", version: release_version, sha: ENV["SHA"], environment: Rails.env, features: Rails.configuration.x.features }, status: :ok
  end

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end

protected

  def release_version
    ENV["RELEASE_VERSION"] || "-"
  end
end
