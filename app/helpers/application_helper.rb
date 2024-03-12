module ApplicationHelper
  def nav_link_to(title:, path:)
    classes = %w[govuk-header__navigation-item]
    classes << 'govuk-header__navigation-item--active' if request.path == path || (request.path == '/admin' && path == '/admin/users')
    tag.li(class: classes) do
      link_to title, path, class: 'govuk-header__link', aria: { current: 'page' }
    end
  end

  def feature_image(page:)
    if page.featured_image.attached?
      image_tag(url_for(page.featured_image), class: 'page-responsive-img', alt: page.featured_alt_text, title: page.featured_alt_text, width: '500px')
    else
      image_text = page.featured_alt_text || 'featured image alt text missing'
      image_tag('apple.jpeg', class: 'page-responsive-img', alt: image_text, title: image_text)
    end
  end

  def link_to_preview(article, link_to_args = {})
    return unless policy(article).preview?

    text = policy(article).publish? ? 'Preview and publish' : 'Preview'
    link_to text, admin_article_path(article), link_to_args
  end

  def navigation
    render(HeaderComponent.new(service_name: t('service.name'), classes: 'dfe-header noprint', container_classes: %w[dfe-header-f-header-flex], navigation_label: 'Primary navigation')) do |header|
      header.with_navigation_item(
        text: 'Home', href: '/', active: request.path == root_path, classes: %w[dfe-header__navigation-item],
      )
      menu.each do |item|
        header.with_navigation_item(
          text: item.title,
          href: item.path,
          active: item.slug == section,
          classes: %w[dfe-header__navigation-item],
        )
      end
    end
  end

  def menu
    @menu ||= Web::Page.home.pages
  end

  def footer_menu
    @footer_menu ||= Web::Page.footer.pages
  end
end
