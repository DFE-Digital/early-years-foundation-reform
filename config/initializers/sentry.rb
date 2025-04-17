Sentry.init do |config|
  config.dsn = Rails.application.config.sentry_dsn
  config.breadcrumbs_logger = %i[active_support_logger http_logger]
  config.enabled_environments = %w[production]
  config.environment = Rails.application.config.environment
  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 0.1
end
