module AuthHelper
  def http_login(user, password)
    ActionController::HttpAuthentication::Basic.encode_credentials(user, password)
  end
end
