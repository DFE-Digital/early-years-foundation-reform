class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def flipper_session_id
    session[FlipperSession.session_key] ||= FlipperSession.generate_id
  end
  helper_method :flipper_session_id

  def flipper_session
    @flipper_session ||= FlipperSession.new(flipper_session_id)
  end
  helper_method :flipper_session
end
