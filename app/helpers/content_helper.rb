module ContentHelper
  def path_for_this_page
    content_url + "/" + page.slug
  end
end
