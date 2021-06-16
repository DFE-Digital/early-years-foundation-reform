module ApplicationHelper
  def nav_link_to(title:, path:)
    if request.path == path
      tag.li(class: "govuk-header__navigation-item govuk-header__navigation-item--active") do
        link_to title, path, class: "govuk-header__link", aria: { current: "page" }
      end
    else
      tag.li(class: "govuk-header__navigation-item govuk-header__navigation-item") do
        link_to title, path, class: "govuk-header__link", aria: { current: "page" }
      end
    end
  end
end
