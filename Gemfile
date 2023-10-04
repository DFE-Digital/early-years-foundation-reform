source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").chomp

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.1.4"

# User accounts; required in config/application.rb
gem "devise", ">= 4.7.3"
gem "pundit", "~> 2.1"

# Use postgresql as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"

# Use Puma as the app server
gem "puma", "~> 5.6"

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.4"

gem "haml", "~> 5.2"

gem "active_storage_validations", "~> 0.9"
gem "aws-sdk-s3", "~> 1.109"
gem "ratonvirus", "~> 0.2.0"
gem "ratonvirus-resty"

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
gem "bcrypt", "~> 3.1.16"

# Manage multiple processes i.e. web server and webpack
gem "foreman", "~> 0.87"

# Canonical meta tag
gem "canonical-rails", "~> 0.2"

gem "acts_as_tree", "~> 2.9"

gem "acts_as_paranoid", "~> 0.7"

gem "audited", "~> 5.0"

gem "govspeak"
gem "htmlentities", "4.3.4"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.1.0", require: false

# Manage seeds
gem "dibber"

# Monitor errors
gem "sentry-rails"
gem "sentry-ruby"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]

  # GOV.UK interpretation of rubocop for linting Ruby
  gem "rubocop-govuk", "~> 4.2"
  gem "scss_lint-govuk"

  # Debugging
  gem "pry-byebug", "~> 3.9"

  gem "dotenv-rails", "~> 2.7"

  gem "factory_bot_rails", "~> 6.2"

  gem "faker", "~> 2.18"

  gem "axe-matchers", "~> 2.6"
  gem "cucumber", "~> 6.1"
  gem "rspec", "~> 3.10"
  gem "rspec-expectations", "~> 3.10"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.8"
  gem "web-console", ">= 3.3.0"

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring", ">= 2.1.1"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "axe-core-capybara"
  gem "axe-core-rspec"
  gem "axe-core-selenium"

  gem "capybara", "~> 3.36"
  gem "launchy"
  gem "rspec-rails", "~> 5.0"
  gem "selenium-webdriver"
  gem "simplecov", "~> 0.21", require: false
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

gem "devise-security", "~> 0.17.0"

gem "govuk_design_system_formbuilder", "~> 2.8"

gem "friendly_id", "~> 5.4"

gem "govuk-components", "~> 2.1"
