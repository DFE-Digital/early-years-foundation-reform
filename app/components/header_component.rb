# frozen_string_literal: true

#
# Support for new DfE Frontend
# @see https://design.education.gov.uk/design-system/dfe-frontend
# Custom DfE header with a logo and account action links.
# Inherits the service navigation slot from GOV.UK Components.
# @see https://govuk-components.x-govuk.org/components/header/
#
class HeaderComponent < GovukComponent::HeaderComponent
  renders_many :action_links, 'ActionLinkItem'

  class ActionLinkItem < ViewComponent::Base
    def initialize(text:, href: nil, options: {})
      super()

      @text = text
      @href = href
      @options = options
    end

    def call
      if @href.present?
        helpers.govuk_link_to(@text, @href, **@options)
      else
        @text
      end
    end
  end
end
