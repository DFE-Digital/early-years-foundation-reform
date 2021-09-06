# frozen_string_literal: true

module GoogleAnalytics
  #CONTAINER_ID = Rails.application.credentials.dig :google_analytics, Rails.configuration.space.to_sym, :container_id
  #TRACKING_ID = Rails.application.credentials.dig :google_analytics, Rails.configuration.space.to_sym, :tracking_id
  CONTAINER_ID = ENV['GOOGLE_ANALYTICS_CONTAINER_ID']
  TRACKING_ID = ENV['GOOGLE_ANALYTICS_TRACKING_ID']
  JS_URL = "https://www.googletagmanager.com/ns.html?id=#{GoogleAnalytics::TRACKING_ID}"
end
