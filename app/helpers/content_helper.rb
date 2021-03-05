module ContentHelper
  def path_for_this_page(page)
    # Add parent links
    if (page.parent_id)
      "#{content_url}/#{page.parent.slug}/#{page.slug}"
    else
      "#{content_url}/#{page.slug}"
    end
  end

  def is_current?(page)
    page.slug == params[:slug]
  end
end
