module FeedbacksHelper
  def link_to_feedback(args = {})
    link_to(
      'Give Feedback',
      Rails.configuration.feedback_url,
      {
        class: 'govuk-button',
        data: {
          track_category: 'Onsite Feedback',
          track_action: 'GOV-UK Open Form',
        },
        aria: {
          controls: 'something-is-wrong',
          expanded: 'false',
        },
      }.merge(args),
    )
  end
end
