module BotAuthProtection
  extend ActiveSupport::Concern

  BOT_AUTH_WINDOW = 5.minutes
  BOT_AUTH_MAX_ATTEMPTS = 20

private

  def enforce_bot_auth!(scope:, valid:, unauthorized_payload: { status: 'invalid secure header' })
    if valid
      clear_failed_bot_auth(scope)
      return true
    end

    if bot_auth_rate_limited?(scope)
      Rails.logger.warn("[BotAuth] rate limited scope=#{scope} ip=#{bot_auth_ip} path=#{request.path}")
      render json: { status: 'rate limited' }, status: :too_many_requests
      return false
    end

    track_failed_bot_auth(scope)
    render json: unauthorized_payload, status: :unauthorized
    false
  end

  def bot_auth_rate_limited?(scope)
    Rails.cache.read(bot_auth_cache_key(scope)).to_i >= BOT_AUTH_MAX_ATTEMPTS
  end

  def track_failed_bot_auth(scope)
    key = bot_auth_cache_key(scope)
    attempts = Rails.cache.increment(key, 1, expires_in: BOT_AUTH_WINDOW)

    if attempts.nil?
      Rails.cache.write(key, 1, expires_in: BOT_AUTH_WINDOW)
      attempts = 1
    end

    Rails.logger.warn("[BotAuth] unauthorized scope=#{scope} ip=#{bot_auth_ip} path=#{request.path} attempts=#{attempts}")
  end

  def clear_failed_bot_auth(scope)
    Rails.cache.delete(bot_auth_cache_key(scope))
  end

  def bot_auth_cache_key(scope)
    "bot-auth:#{scope}:#{bot_auth_ip}"
  end

  def bot_auth_ip
    request.remote_ip.presence || 'unknown'
  end
end
