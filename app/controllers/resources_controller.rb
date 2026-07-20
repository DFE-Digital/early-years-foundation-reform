class ResourcesController < ApplicationController
  def show
    return render_not_found unless Rails.application.preview? || Rails.env.test?
    return render_not_found if resource.blank?

    render html: resource, layout: true
  end

private

  # @return [String] I18n key - dot separated values
  def resource_name
    params.permit(:id)[:id]
  end

  # @return [String]
  def resource
    resource = Resource.by_name(resource_name)
    return if resource.blank? || resource.body.blank?

    helpers.m(resource.body)
  end

  def render_not_found
    render 'errors/not_found', status: :not_found
  end
end
