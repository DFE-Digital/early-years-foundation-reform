require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"
require "govuk/components"

require_relative "../lib/rack/reject_trace"


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GovukRailsBoilerplate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.autoloader = :classic

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.exceptions_app = routes

    # disable client-side XSS Auditors, as they have been removed from most
    # modern browsers because they can cause additional vulnerabilities
    # (see https://cheatsheetseries.owasp.org/cheatsheets/Cross_Site_Scripting_Prevention_Cheat_Sheet.html#x-xss-protection-header)
    config.action_dispatch.default_headers['X-XSS-Protection'] = "0"

    config.middleware.use Rack::RejectTrace
    config.middleware.use Rack::Deflater
    config.space = ENV.fetch( 'DOMAIN', "eyfs-dev" ).split(".").first

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', 'content', '*.{rb,yml}').to_s]

    config.x.feedback.remote_url = "https://docs.google.com/forms/d/e/1FAIpQLSeLpjkKhcwKUjBKRx29fUgzgslSAkE9pPzkcmp3Oer5T6JHDw/viewform"
  end
end
