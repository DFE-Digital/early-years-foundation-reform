module ContentPagesHelper
  def get_all_content_pages
    @content_pages = ContentPage.top_level.order_by_position
  end
end