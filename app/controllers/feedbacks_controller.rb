class FeedbacksController < ApplicationController
  # rubocop:disable Rails/SaveBang
  # POST /feedbacks
  def create
    feedback = Feedback.create(feedback_params)
    cookies[:feedback_page_useful] = cookie(feedback)
    uri = redirect_uri
    uri.fragment = "feedback"
    redirect_to uri.to_s
  end
# rubocop:enable Rails/SaveBang

private

  def redirect_uri
    URI(request.referer.presence || root_path)
  end

  def cookie(feedback)
    feedback.valid? ? { value: feedback.page_useful, expires: 5.seconds.from_now } : nil
  end

  def feedback_params
    params.require(:feedback).permit(:page_useful).merge(page_url: request.referer)
  end
end
