class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def check
    render json: { status: "OK", version: ENV["SHA"], environment: Rails.env }, status: :ok
  end

private

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end
end
