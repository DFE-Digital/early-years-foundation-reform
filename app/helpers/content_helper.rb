module ContentHelper
  def path_for_this_page(page)
    "#{content_url}/#{page.slug}"
  end

  def is_selected(page)
    page.slug == params[:slug]
  end
end
