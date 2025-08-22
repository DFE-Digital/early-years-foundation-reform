# frozen_string_literal: true

#
# Support for new DfE Frontend
# @see https://design.education.gov.uk/design-system/dfe-frontend
#
class HeaderComponent < GovukComponent::HeaderComponent
  include Devise::Controllers::Helpers

  renders_many :action_links, 'ActionLinkItem'

private

  def default_attributes
    { class: %w[govuk-header] }
  end

  def navigation_html_attributes
    nc = %w[govuk-service-navigation__list] << custom_navigation_classes.compact

    { id: 'navigation', class: nc, aria: { label: navigation_label } }
  end

  def container_html_attributes
    { class: %w[govuk-header__container govuk-width-container] }
  end

  class ActionLinkItem < GovukComponent::HeaderComponent::NavigationItem
    def active_class
      ['govuk-header__navigation-item--current'] if active?
    end

    def call
      if link?
        govuk_link_to(text, href, **options)
      else
        text
      end
    end
  end

  class NavigationItem < GovukComponent::HeaderComponent::NavigationItem
    def active_class
      ['govuk-service-navigation__item--current'] if active?
    end

    def call
      tag.li(**html_attributes) do
        if link?
          link_to(href, class: 'govuk-service-navigation__link', **options) do
            text
          end
        else
          text
        end
      end
    end

  private

    def default_attributes
      { class: %w[govuk-service__navigation-item] }
    end
  end
end
