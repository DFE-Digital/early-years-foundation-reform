module ApplicationHelper
  def navigation
    render(HeaderComponent.new(service_name: t('service.name'), classes: 'dfe-header noprint', navigation_label: 'Primary navigation')) do |header|
      header.with_navigation_item(
        text: 'Home', href: '/', active: request.path == root_path, classes: %w[dfe-header__navigation-item],
      )
      Page.home.pages.each do |item|
        header.with_navigation_item(
          text: item.title,
          href: item.path,
          active: item.slug == section,
          classes: %w[dfe-header__navigation-item],
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
