# frozen_string_literal: true

module GoogleAnalytics
  TRACKING_ID = Rails.application.credentials.dig :google_analytics, Rails.configuration.space, :tracking_id
  JS_URL = "https://www.googletagmanager.com/ns.html?id=#{GoogleAnalytics::TRACKING_ID}"
end
