page_attrs = I18n.t("content.communication_and_language")

ContentPage.new(is_published: true, **page_attrs) do |parent_page|
  parent_page.save!
  puts parent_page.inspect
  %i[exploring_language interactions listening_and_understanding].each do |key|
    unless ContentPage.exists?(slug: key)
      attrs = I18n.t("content.#{key}")
      child_page = ContentPage.new(parent_id: parent_page.id, is_published: true, **attrs)
      child_page.save!
    end
  end
end