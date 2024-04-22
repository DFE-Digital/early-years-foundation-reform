class SettingsController < ApplicationController
  def create
    set_cookie_pref

    if settings_params[:settings_updated].present?
      flash[:notice] = t(:preferences_saved_html, scope: 'settings')
    end

    redirect_to request_path
  end

private

  def set_cookie_pref
    cookies[:track_analytics] = {
      value: settings_params[:track_analytics],
      expires: 6.months.from_now,
    }

    if params.fetch(:notify_if_successful, false)
      flash[:notice] = t(:preferences_saved_html, return_url: helpers.root_path, scope: :settings)
    end
  end

  def request_path
    params[:request_path] || params[:return_url]
  end

  def settings_params
    params.permit(:request_path, :track_analytics, :settings_updated)
  end

  def track_analytics
    params.fetch(:track_analytics, 'No')
  end

  def template
    page_params[:id].underscore
  end

  def page_params
    params.permit(:id)
  end
end
