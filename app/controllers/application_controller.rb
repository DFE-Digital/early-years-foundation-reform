class ApplicationController < ActionController::Base
  layout 'application'

  default_form_builder(GOVUKDesignSystemFormBuilder::FormBuilder)

  before_action { cookies.delete :track_google_analytics }

  before_action :prepare_cms

  helper_method :menu_item, :section

  def check
    render json: { status: 'OK', version: release_version, sha: ENV['SHA'], environment: Rails.env }, status: :ok
  end

protected

  # @return [Symbol]
  def prepare_cms
    # ensure correct API for each request
    ContentfulModel.use_preview_api = Rails.application.preview?

    Page.reset_cache_key!

    :done
  end

  def release_version
    ENV.fetch('RELEASE_VERSION', '-')
  end

private

  def content
    @content ||= Rails.configuration.content
  end

  def menu_item
    :home
  end

  def section
    ''
  end

  def not_found
    raise ActionController::RoutingError, 'Not Found'
  end

  def after_sign_out_path_for(_resource_or_scope)
    request.referer
  end
end
