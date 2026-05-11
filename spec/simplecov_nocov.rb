# frozen_string_literal: true

# Exclude images and other non-code assets from SimpleCov coverage
require 'simplecov'
SimpleCov.start do
  add_filter '/app/assets/images/'
  add_filter '/app/assets/fonts/'
  add_filter '/public/'
end
