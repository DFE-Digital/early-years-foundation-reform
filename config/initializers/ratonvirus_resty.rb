Ratonvirus::Resty.configure do |config|
  # Sets the base url for api requests
  config.service_url = ENV.fetch("RESTY_SERVICE_URL", "https://eyfs-clamav-rest.london.cloudapps.digital/scan")
  # Optional sets the username for api requests
  config.username = ENV.fetch("RESTY_USERNAME", nil)
  # Optional sets the password for api requests
  config.password = ENV.fetch("RESTY_PASSWORD", nil)
  # Optional sets the proxy url
  config.proxy_url = ENV.fetch("PROXY_URL", nil)
end
