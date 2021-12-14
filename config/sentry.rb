Sentry.init do |config|
  config.dsn = "https://3c622306510d4c059905155154f5e1a7@o418248.ingest.sentry.io/6106997"
  config.breadcrumbs_logger = %i[active_support_logger http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 1.0
end
