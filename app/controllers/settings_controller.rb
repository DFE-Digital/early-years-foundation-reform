class SettingsController < ApplicationController
  layout "settings"

  def create
    if params.key?(:track_google_analytics)
      set_cookie_pref(params[:track_google_analytics])
      flash[:notice] = "Preferences Saved."
      redirect_to params[:return_url]
    else
      raise "Missing parameters"
    end
  end

  def show
    render template: "settings/#{params[:id]}"
  end

end
