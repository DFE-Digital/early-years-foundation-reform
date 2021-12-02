# frozen_string_literal: true

module ResponseBodyHelpers
  # Removes HTML escaping from response.body so for example `don&#39;t` in the page body is returned as `don't`
  # which is then easier to compare within a spec.
  def unescaped_response_body
    @unescaped_response_body ||= CGI.unescapeHTML(response.body)
  end

  # Returns the HTML in the response in a format (Nokogiri HTML document) that can be navigated via css and xpath.
  def html_document
    @html_document ||= Nokogiri::HTML(response.body)
  end
end

RSpec.configure do |config|
  config.include ResponseBodyHelpers
end
