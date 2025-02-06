require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'govuk/components'

require_relative '../lib/rack/reject_trace'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GovukRailsBoilerplate
  class Application < Rails::Application
    config.load_defaults 7.0
    # Initialize configuration defaults for originally generated Rails version.

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # config.assets.paths << Rails.root.join('node_modules/govuk-frontend/govuk/assets').to_s
    config.exceptions_app = routes

    # disable client-side XSS Auditors, as they have been removed from most
    # modern browsers because they can cause additional vulnerabilities
    # (see https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html#x-xss-protection-header)
    config.action_dispatch.default_headers['X-XSS-Protection'] = '0'

    config.middleware.use Rack::RejectTrace
    config.middleware.use Rack::Deflater

    config.i18n.load_path += Dir[Rails.root.join('config/locales/content/*.{rb,yml}').to_s]

    config.feedback_url = ENV.fetch('FEEDBACK_URL', '#FEEDBACK_env_var_missing')
    config.privacy_policy_url = ENV.fetch('PRIVACY_POLICY_URL', '#PRIVACY_POLICY_env_var_missing')
    config.signup_url = ENV.fetch('SIGNUP_URL', '#SIGNUP_env_var_missing')
    config.tracking_id = ENV.fetch('TRACKING_ID', '#TRACKING_ID_env_var_missing')
    config.js_url = "https://www.googletagmanager.com/gtag/js?id=#{config.tracking_id}"

    # Contentful
    config.contentful_space                   = ENV.fetch('CONTENTFUL_SPACE', credentials.dig(:contentful, :space))
    config.contentful_delivery_access_token   = ENV.fetch('CONTENTFUL_DELIVERY_TOKEN', credentials.dig(:contentful, :delivery_access_token))
    config.contentful_preview_access_token    = ENV.fetch('CONTENTFUL_PREVIEW_TOKEN', credentials.dig(:contentful, :preview_access_token))
    config.contentful_management_access_token = ENV.fetch('CONTENTFUL_MANAGEMENT_TOKEN', credentials.dig(:contentful, :management_access_token)) # TODO: use service account management token
    config.contentful_environment             = ENV.fetch('CONTENTFUL_ENVIRONMENT', credentials.dig(:contentful, :environment))

    # config.active_record.legacy_connection_handling = false
    config.generators.test_framework = :rspec

    # Sentry
    config.sentry_dsn = ENV.fetch('SENTRY_DSN', '#SENTRY_DSN_env_var_missing')

    #
    # Azure Environments
    #

    # @return [Boolean]
    def live?
      ENV['ENVIRONMENT'].eql?('production')
    end

    # @return [Boolean]
    def staging?
      ENV['ENVIRONMENT'].eql?('staging')
    end

    # @return [Boolean]
    def dev?
      ENV['ENVIRONMENT'].eql?('development')
    end

    # @return [Boolean]
    def preview?
      Dry::Types['params.bool'][ENV.fetch('CONTENTFUL_PREVIEW', false)]
    end
  end
end
