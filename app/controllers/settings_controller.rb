class SettingsController < ApplicationController
  layout "settings"

  def create
    if params.key?(:track_google_analytics)
      set_cookie_pref(params[:track_google_analytics])
      redirect_to params[:return_url]
    else
      raise "Missing parameters"
    end
  end

  def show
    render template: "settings/#{params[:id]}"
  end

private

  def set_cookie_pref(cookie_value)
    cookies[:track_google_analytics] = { value: cookie_value, expires: 6.months.from_now }
    flash[:notice] = t(:preferences_saved_html, return_url: helpers.root_path, scope: :settings)
  end
end
