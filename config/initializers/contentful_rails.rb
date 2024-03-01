require 'caching'

require 'web/page'
require 'web/resource'

ContentfulModel.use_preview_api = Rails.application.preview?

ContentfulRails.configure do |config|
  config.space            = Rails.application.config.contentful_space
  config.environment      = Rails.application.config.contentful_environment
  config.perform_caching  = Rails.env.production?
  config.default_locale   = 'en-US'

  # Tokens
  config.access_token         = Rails.application.config.contentful_delivery_access_token
  config.preview_access_token = Rails.application.config.contentful_preview_access_token
  config.management_token     = Rails.application.config.contentful_management_access_token

  # Preview
  config.enable_preview_domain = Rails.application.preview?
  config.eager_load_entry_mapping = false

  config.contentful_options = {
    logger: Rails.logger,

    max_include_resolution_depth: 1,
    reuse_entries: true,
    preview_api: { timeout_connect: 2, timeout_read: 6, timeout_write: 20 },
    delivery_api: { timeout_connect: 2, timeout_read: 6, timeout_write: 20 },
    management_api: { timeout_connect: 3, timeout_read: 100, timeout_write: 200 },

    entry_mapping: {
      'page' => Web::Page,
      'resource' => Web::Resource,
    },
  }
end
