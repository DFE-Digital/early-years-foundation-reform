Ratonvirus::Resty.configure do |config|
  # Sets the base url for api requests
  #
  # default: config.base_url = ENV.fetch('RESTY_SERVICE_URL') { 'http://localhost:9000/scan' }
  #
  config.service_url = ENV.fetch("RESTY_SERVICE_URL", "http://localhost:9000/scan")

  # Optional sets the username for api requests
  #
  # config.username = ENV.fetch('RESTY_USERNAME', nil)
  #
  config.username = ENV.fetch("RESTY_USERNAME", nil)
  # Optional sets the password for api requests
  #
  # config.password = ENV.fetch('RESTY_PASSWORD', nil)
  #
  config.password = ENV.fetch("RESTY_PASSWORD", nil)

  # Optional sets the proxy url
  #
  # config.proxy_url = ENV.fetch('PROXY_URL', nil)
  #
  config.proxy_url = ENV.fetch("PROXY_URL", nil)
end
