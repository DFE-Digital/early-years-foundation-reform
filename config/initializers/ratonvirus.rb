Ratonvirus.configure do |config|
  if Rails.env.test?
    config.scanner = :eicar
    config.storage = :filepath
  else
    config.scanner = :resty
    config.storage = :active_storage
  end
end
