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

  def link_to_feedback(args = {})
    link_to(
      "Give Feedback",
      Rails.configuration.x.feedback.remote_url,
      {
        class: "govuk-button",
        data: {
          track_category: "Onsite Feedback",
          track_action: "GOV-UK Open Form"
        },
        aria: {
          controls: "something-is-wrong",
          expanded: "false"
        }
      }.merge(args)
    )
  end
end
