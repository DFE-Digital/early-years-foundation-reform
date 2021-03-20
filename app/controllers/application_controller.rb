class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def check
    render json: { status: "OK", version: ENV["SHA"], environment: Rails.env }, status: :ok
  end

  def not_found
    raise ActionController::RoutingError, "Not Found"
  end

private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

  def set_cookie_pref(pref)
    if pref == "Yes"
      cookies.permanent[:track_google_analytics] = "Yes"
    else
      cookies.permanent[:track_google_analytics] = "No"
    end
    flash[:notice] = "Preferences Saved."
  end

end
