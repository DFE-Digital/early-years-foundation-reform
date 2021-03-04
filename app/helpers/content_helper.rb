module ContentHelper
  def path_for_this_page(page)
    "#{content_url}/#{page.slug}"
  end

  def is_current?(page)
    page.slug == params[:slug]
  end

  def find_children_for_page_with_title(title)
    ContentPage.find_by_title(title)&.children
  end
end
