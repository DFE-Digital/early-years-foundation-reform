class ApplicationController < ActionController::Base
  layout ENV.fetch('NEW_DESIGN', nil).present? ? 'application' : 'beta/application'
  default_form_builder(GOVUKDesignSystemFormBuilder::FormBuilder)
  before_action { cookies.delete :track_google_analytics }
  before_action do |_controller|
    @page = OpenStruct.new(title: t(params[:action], default: params[:action].humanize, scope: params[:controller].parameterize))
  end

  include Pundit::Authorization

  helper_method :group

  def check
    render json: { status: "OK", version: release_version, sha: ENV["SHA"], environment: Rails.env }, status: :ok
  end

protected

  def release_version
    ENV["RELEASE_VERSION"] || "-"
  end

private

  def content
    @content ||= Rails.configuration.content
  end

  def group
    :home
  end

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end

  def after_sign_out_path_for(_resource_or_scope)
    request.referer
  end
end
