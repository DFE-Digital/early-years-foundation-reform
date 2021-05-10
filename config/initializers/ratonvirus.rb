Ratonvirus.configure do |config|
  if Rails.env.production?
    config.scanner = :resty
    config.storage = :active_storage
  else
    config.scanner = :eicar
    config.storage = :filepath
  end
end
