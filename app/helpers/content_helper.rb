module ContentHelper
  def subnav_link_css_classes(content_page)
    klasses = content_page.try(:parent_id) ? "govuk-link app-subnav__link govuk-link--no-visited-state" : "govuk-link app-subnav__link govuk-link--no-visited-state govuk-!-margin-bottom-2"
    content_page.slug == params[:slug] ? klasses + " app-subnav__section-item--current" : klasses
  end
end
