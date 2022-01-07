module ApplicationHelper
  def nav_link_to(title:, path:)
    if request.path == path || (request.path == "/admin" && path == "/admin/users")
      tag.li(class: "govuk-header__navigation-item govuk-header__navigation-item--active") do
        link_to title, path, class: "govuk-header__link", aria: { current: "page" }
      end
    else
      tag.li(class: "govuk-header__navigation-item govuk-header__navigation-item") do
        link_to title, path, class: "govuk-header__link", aria: { current: "page" }
      end
    end
  end

  def feature_image(page:)
    if page.featured_image.attached?
      tag.div(class: "page-img-container") do
        image_tag(url_for(page.featured_image), class: "page-responsive-img", alt: page.featured_alt_text, title: page.title, width: "500px")
      end
    end
  end
end
