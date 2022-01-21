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
        image_tag(url_for(page.featured_image), class: "page-responsive-img", alt: page.featured_alt_text, title: page.featured_alt_text, width: "500px")
      end
    else
      tag.div(class: "page-img-container") do
        image_text = page.featured_alt_text || "featured image alt text missing"
        image_tag("apple.jpeg", class: "page-responsive-img", alt: image_text, title: image_text)
      end
    end
  end

  def link_to_preview(article, link_to_args = {})
    return unless policy(article).preview?

    text = policy(article).publish? ? "Preview and publish" : "Preview"
    link_to text, admin_article_path(article), link_to_args
  end

  def link_to_feedback(args = {})
    link_to(
      "Give Feedback",
      Rails.configuration.x.feedback.remote_url,
      {
        class: "govuk-button",
        data: {
          track_category: "Onsite Feedback",
          track_action: "GOV-UK Open Form",
        },
        aria: {
          controls: "something-is-wrong",
          expanded: "false",
        },
      }.merge(args),
    )
  end
end
