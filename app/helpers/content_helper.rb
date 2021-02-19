module ContentHelper
  def path_for_this_page(page)
    "#{content_url}/#{page.slug}"
  end

  def has_active_css(href)
    "app-mobile-nav__subnav-item--current" if current_page?(href)
  end

  def is_selected(page)
    page.slug == params[:slug]
  end

end
