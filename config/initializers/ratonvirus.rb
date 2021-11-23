Ratonvirus.configure do |config|
  if Rails.env.test? || Rails.env.development?
    config.scanner = :eicar
    config.storage = :filepath
  # :nocov: By definition this won't be run in test
  else
    config.scanner = :resty
    config.storage = :active_storage
  end
  # :nocov:
end
