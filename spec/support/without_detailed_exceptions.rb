# This is needed so that we can test 404s in request specs
# Without it, 404 views are not rendered in test, instead a
# stack trace is shown.  Even though the 4040 does work fine
# in the development and production environments
# See https://github.com/rspec/rspec-rails/issues/2024
module WithoutDetailedExceptions
  RSpec.configure do |config|
    config.include self, type: :request
  end

  def without_detailed_exceptions
    env_config = Rails.application.env_config
    original_show_exceptions = env_config["action_dispatch.show_exceptions"]
    original_show_detailed_exceptions = env_config["action_dispatch.show_detailed_exceptions"]
    env_config["action_dispatch.show_exceptions"] = true
    env_config["action_dispatch.show_detailed_exceptions"] = false
    yield
  ensure
    env_config["action_dispatch.show_exceptions"] = original_show_exceptions
    env_config["action_dispatch.show_detailed_exceptions"] = original_show_detailed_exceptions
  end
end
