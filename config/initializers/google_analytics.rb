# frozen_string_literal: true

module GoogleAnalytics
  Rails.logger.debug Rails.application.credentials.inspect
  CONTAINER_ID = Rails.application.credentials.dig :google_analytics, Rails.configuration.space.to_sym, :container_id
  TRACKING_ID = Rails.application.credentials.dig :google_analytics, Rails.configuration.space.to_sym, :tracking_id
  JS_URL = "https://www.googletagmanager.com/ns.html?id=#{GoogleAnalytics::TRACKING_ID}"
end
