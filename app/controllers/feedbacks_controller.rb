class FeedbacksController < ApplicationController
  # POST /feedbacks
  def create
    feedback = Feedback.new(feedback_params)
    cookies[:feedback_page_useful] = cookie(feedback)
    uri = redirect_uri
    uri.fragment = "feedback"
    redirect_to uri.to_s, format: :html
  end

private

  def redirect_uri
    URI(request.referer.presence || root_path)
  end

  def cookie(feedback)
    feedback.valid? ? { value: feedback.page_useful, expires: 5.seconds.from_now } : nil
  end

  def feedback_params
    params.require(:feedback).permit(:page_useful)
  end
end
