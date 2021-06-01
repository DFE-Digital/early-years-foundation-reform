class SettingsController < ApplicationController
  before_action do |_controller|
    @page = OpenStruct.new(title: t(params[:id], scope: params[:controller].parameterize))
  end

  def create
    set_cookie_pref(track_google_analytics)
    redirect_to params[:return_url]
  end

  def show
    render template: "settings/#{params[:id]}"
  end

private

  def track_google_analytics
    params.fetch(:track_google_analytics, "No")
  end

  def set_cookie_pref(cookie_value)
    cookies[:track_google_analytics] = { value: cookie_value, expires: 6.months.from_now }
    flash[:notice] = t(:preferences_saved_html, return_url: helpers.root_path, scope: :settings)
  end
end
