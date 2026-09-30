module ApplicationHelper
  def navigation
    current_section = respond_to?(:section) ? section : ''

    render(HeaderComponent.new) do |header|
      header.with_service_navigation(
        service_name: t('service.name'),
        service_url: root_path,
        classes: 'noprint',
      ) do |navigation|
        navigation.with_navigation_item(
          text: 'Home',
          href: root_path,
          current: current_page?(root_path),
        )
        Page.navigation_items.each do |item|
          navigation.with_navigation_item(
            text: item.title,
            href: item.path,
            current: item.slug == current_section,
          )
        end
      end
    end
  end

  def track_analytics?
    cookies[:track_analytics_v2] == 'Yes'
  end

  # @return [Boolean]
  def debug?
    Dry::Types['params.bool'][ENV.fetch('DEBUG', false)]
  end

  # @return [Boolean]
  def show_important_banner?
    ENV['SHOW_IMPORTANT_BANNER'] == 'true'
  end

  # @param parts [Array<String>]
  # @return [String]
  def html_title(*parts)
    [t('service.name'), *parts].join(' : ')
  end
end
