# frozen_string_literal: true

module GoogleAnalytics
  TRACKING_ID = ENV.fetch("TRACKING_ID", "#TRACKING_ID_env_var_missing")
  JS_URL = "https://www.googletagmanager.com/ns.html?id=#{GoogleAnalytics::TRACKING_ID}"
end
