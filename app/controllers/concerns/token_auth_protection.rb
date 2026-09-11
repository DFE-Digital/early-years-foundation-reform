module TokenAuthProtection
  extend ActiveSupport::Concern

  TOKEN_AUTH_WINDOW = 5.minutes
  TOKEN_AUTH_MAX_ATTEMPTS = 20

private

  def enforce_token_auth!(scope:, valid:, unauthorized_payload: { status: 'invalid secure header' })
    if valid
      clear_failed_token_auth(scope)
      return true
    end

    if token_auth_rate_limited?(scope)
      Rails.logger.warn("[BotAuth] rate limited scope=#{scope} ip=#{token_auth_ip} path=#{request.path}")
      render json: { status: 'rate limited' }, status: :too_many_requests
      return false
    end

    track_failed_token_auth(scope)
    render json: unauthorized_payload, status: :unauthorized
    false
  end

  def token_auth_rate_limited?(scope)
    Rails.cache.read(token_auth_cache_key(scope)).to_i >= TOKEN_AUTH_MAX_ATTEMPTS
  end

  def track_failed_token_auth(scope)
    key = token_auth_cache_key(scope)
    attempts = Rails.cache.increment(key, 1, expires_in: TOKEN_AUTH_WINDOW)

    if attempts.nil?
      Rails.cache.write(key, 1, expires_in: TOKEN_AUTH_WINDOW)
      attempts = 1
    end

    Rails.logger.warn("[TokenAuth] unauthorized scope=#{scope} ip=#{token_auth_ip} path=#{request.path} attempts=#{attempts}")
  end

  def clear_failed_token_auth(scope)
    Rails.cache.delete(token_auth_cache_key(scope))
  end

  def token_auth_cache_key(scope)
    "bot-auth:#{scope}:#{token_auth_ip}"
  end

  def token_auth_ip
    request.remote_ip.presence || 'unknown'
  end
end
