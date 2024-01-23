require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"
require "govuk/components"

require_relative "../lib/rack/reject_trace"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GovukRailsBoilerplate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    #config.assets.paths << Rails.root.join('node_modules/govuk-frontend/govuk/assets').to_s
    config.exceptions_app = routes

    # disable client-side XSS Auditors, as they have been removed from most
    # modern browsers because they can cause additional vulnerabilities
    # (see https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html#x-xss-protection-header)
    config.action_dispatch.default_headers['X-XSS-Protection'] = "0"

    config.middleware.use Rack::RejectTrace
    config.middleware.use Rack::Deflater

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'content', '*.{rb,yml}').to_s]

    config.feedback_url = ENV.fetch('FEEDBACK_URL', config_for(:configuration)['feedback_url'] || '#FEEDBACK_env_var_missing')
    config.signup_url = ENV.fetch('SIGNUP_URL', config_for(:configuration)['signup_url'] || '#SIGNUP_env_var_missing')
    config.tracking_id = ENV.fetch('TRACKING_ID', config_for(:configuration)['tracking_id'] || '#TRACKING_ID_env_var_missing')
    config.js_url = "https://www.googletagmanager.com/ns.html?id=#{config.tracking_id}"

  end
end
