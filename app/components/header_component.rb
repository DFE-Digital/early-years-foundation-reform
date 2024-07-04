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
    { class: %w[dfe-header] }
  end

  def navigation_html_attributes
    nc = %w[dfe-header__navigation] << custom_navigation_classes.compact

    { id: 'header-navigation', class: nc, data: { 'reveal-target': 'item' }, aria: { label: navigation_label, labelledby: 'label-navigation' } }
  end

  def container_html_attributes
    { class: %w[dfe-header__container dfe-width-container] }
  end

  class ActionLinkItem < GovukComponent::HeaderComponent::NavigationItem
    def active_class
      ['dfe-header__action-item--active'] if active?
    end

    def call
      tag.li do
        if link?
          govuk_link_to(text, href, **options)
        else
          text
        end
      end
    end
  end

  class NavigationItem < GovukComponent::HeaderComponent::NavigationItem
    def active_class
      %w[dfe-header__navigation-item--active] if active?
    end

    def call
      tag.li(**html_attributes) do
        if link?
          link_to(href, class: 'dfe-header__navigation-link', **options) do
            text.concat(chevron).html_safe
          end
        else
          text
        end
      end
    end

  private

    def chevron
      tag.svg class: 'dfe-icon dfe-icon__chevron-right', xmlns: 'http://www.w3.org/2000/svg', viewBox: '0 0 24 24', width: 34, height: 34, aria: { hidden: true } do
        tag.path d: 'M15.5 12a1 1 0 0 1-.29.71l-5 5a1 1 0 0 1-1.42-1.42l4.3-4.29-4.3-4.29a1 1 0 0 1 1.42-1.42l5 5a1 1 0 0 1 .29.71z'
      end
    end

    def default_attributes
      { class: %w[dfe-header__navigation-item] }
    end
  end
end
