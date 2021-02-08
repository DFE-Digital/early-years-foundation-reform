module ContentHelper

  # TODO This needs reviewing
  # BEWARE THIS IS monkey patching a route
  def content_path(slug, childslug)
    !childslug ? "/#{controller.controller_name}/#{slug}" : "/#{controller.controller_name}/#{slug}/#{childslug}"
  end

  def subnav_link_css_classes(content_page)
    klasses = content_page.try(:parent_id) ? "govuk-link app-subnav__link govuk-link--no-visited-state" : "govuk-link app-subnav__link govuk-link--no-visited-state govuk-!-margin-bottom-2"
    content_page.slug == params[:slug] ? klasses + " app-subnav__section-item--current" : klasses
  end
end
