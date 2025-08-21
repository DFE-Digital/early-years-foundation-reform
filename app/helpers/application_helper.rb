module ApplicationHelper
  def navigation
    render(HeaderComponent.new(service_name: t('service.name'), classes: 'govuk-header noprint', navigation_label: 'Primary navigation')) do |header|
      header.with_navigation_item(text: 'Home', href: root_path, classes: [
        'govuk-service-navigation__item',
        ('govuk-service-navigation__item--current' if current_page?(root_path)),
      ].compact)

      Page.home.pages.each do |item|
        header.with_navigation_item(
          text: item.title,
          href: item.path,
          classes: [
            'govuk-service-navigation__item',
            ('govuk-service-navigation__item--current' if current_page?(item.path)),
          ].compact,
        )
      end
    end
  end

  def track_analytics?
    cookies[:track_analytics] == 'Yes'
  end

  # @return [Boolean]
  def debug?
    Dry::Types['params.bool'][ENV.fetch('DEBUG', false)]
  end

  # @param parts [Array<String>]
  # @return [String]
  def html_title(*parts)
    [t('service.name'), *parts].join(' : ')
  end
end
