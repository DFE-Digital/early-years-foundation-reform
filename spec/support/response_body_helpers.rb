# frozen_string_literal: true

module ResponseBodyHelpers
  # Removes HTML escaping from response.body so for example `don&#39;t` in the page body is returned as `don't`
  # which is then easier to compare within a spec.
  def unescaped_response_body
    CGI.unescapeHTML(response.body)
  end
end

RSpec.configure do |config|
  config.include ResponseBodyHelpers
end
