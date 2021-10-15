{
  "communication-and-language" => %w[exploring-language interactions listening-and-understanding],
}.each do |parent_slug, child_slugs|
  page_attrs = I18n.t("content.#{parent_slug.underscore}")
  parent_page = if ContentPage.exists?(slug: parent_slug)
                  ContentPage.find_by_slug(parent_slug)
                else
                  ContentPage.new(is_published: true, **page_attrs)
                end

  parent_page.save!
  child_slugs.each do |child_slug|
    next if ContentPage.exists?(slug: child_slug)

    attrs = I18n.t("content.#{child_slug.underscore}")
    child_page = ContentPage.new(parent_id: parent_page.id, is_published: true, **attrs)
    child_page.save!
  end
end
