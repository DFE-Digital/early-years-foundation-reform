# Caches raw Contentful API responses (JSON) in Rails.cache (Redis), keyed by URL —
# the Ruby equivalent of check-an-early-years-qualification's CachingHandler.
#
# WHY at the HTTP layer, not the model layer: ContentfulModel objects hold a live
# client and lazily resolve fields, so they do NOT survive Marshal -> Redis ->
# unmarshal (you get back an object with nil fields). The raw JSON response is just a
# String — Redis stores it perfectly, and the gem rebuilds fresh, fully-working
# objects from it on every cache hit. This gives genuine cross-instance content
# caching without the marshalling wall.
module ContentfulResponseCache
  # Stand-in for the `http` gem's response, exposing only what Contentful::Response
  # reads off it: #status, #to_s (body) and #headers.
  CachedResponse = Struct.new(:status, :body, :headers) do
    delegate :to_s, to: :body
  end

  TTL = 1.hour
  STALE_TTL = 7.days
  RATE_LIMIT_MAX_RETRIES = 2
  RATE_LIMIT_DEFAULT_WAIT = 1.0
  RATE_LIMIT_MAX_WAIT = 5.0
  KEY_PREFIX = 'contentful:resp'.freeze
  STALE_KEY_PREFIX = 'contentful:resp:stale'.freeze
  DELIVERY_HOST = 'cdn.contentful.com'.freeze # delivery API only; never preview/management

  # Overrides Contentful::Client.get_http (a stateless class method).
  def get_http(url, query, headers = {}, proxy = {}, timeout = {})
    return super unless cacheable?(url)

    key = response_key(url, query)
    stale_key = stale_response_key(url, query)
    rate_limit_attempts = 0

    if (hit = safe_read(key))
      return CachedResponse.new(hit[:status], hit[:body], hit[:headers])
    end

    raw = super
    return raw unless raw.status == 200 # don't cache errors

    payload = {
      status: raw.status,
      body: raw.to_s,
      headers: { 'Content-Encoding' => raw.headers['Content-Encoding'] },
    }
    safe_write(key, payload)
    # Keep a non-versioned stale copy so requests can degrade gracefully if
    # Contentful is briefly unavailable just after cache invalidation.
    safe_write(stale_key, payload, expires_in: STALE_TTL)
    CachedResponse.new(payload[:status], payload[:body], payload[:headers])
  rescue ::Contentful::RateLimitExceeded => e
    if rate_limit_attempts < RATE_LIMIT_MAX_RETRIES
      rate_limit_attempts += 1
      wait_seconds = rate_limit_wait_seconds(e)
      Rails.logger.warn("contentful rate limit hit; retrying in #{wait_seconds}s (attempt #{rate_limit_attempts}/#{RATE_LIMIT_MAX_RETRIES})")
      contentful_rate_limit_sleep(wait_seconds)
      retry
    end

    stale_fallback_or_raise(stale_key, e)
  rescue ::HTTP::TimeoutError, ::Contentful::Error => e
    stale_fallback_or_raise(stale_key, e)
  end

private

  # Only cache delivery GETs, and only when a real shared cache is configured (so
  # dev/test on NullStore are unchanged).
  def cacheable?(url)
    Rails.cache.present? &&
      !Rails.cache.is_a?(ActiveSupport::Cache::NullStore) &&
      url.to_s.include?(DELIVERY_HOST)
  end

  # Version the key with the app's content cache_key so a Contentful webhook
  # (Page.reset_cache_key!) rolls the whole namespace = instant invalidation.
  def response_key(url, query)
    digest = Digest::SHA1.hexdigest("#{url}?#{Array(query).sort_by { |k, _| k.to_s }}")
    "#{KEY_PREFIX}:#{content_version}:#{digest}"
  end

  def stale_response_key(url, query)
    digest = Digest::SHA1.hexdigest("#{url}?#{Array(query).sort_by { |k, _| k.to_s }}")
    "#{STALE_KEY_PREFIX}:#{digest}"
  end

  def stale_fallback_or_raise(stale_key, error)
    if (stale_hit = safe_read(stale_key))
      Rails.logger.warn("contentful response cache stale fallback used: #{error.class} - #{error.message}")
      return CachedResponse.new(stale_hit[:status], stale_hit[:body], stale_hit[:headers])
    end

    raise error
  end

  def content_version
    Page.cache_key
  rescue StandardError
    'initial'
  end

  # Extracted for test stubbing.
  # @param seconds [Float]
  def contentful_rate_limit_sleep(seconds)
    sleep(seconds)
  end

  # @param error [Contentful::RateLimitExceeded]
  # @return [Float]
  def rate_limit_wait_seconds(error)
    value = contentful_rate_limit_reset_from_headers(error) || contentful_rate_limit_reset_from_message(error)
    seconds = value&.positive? ? value : RATE_LIMIT_DEFAULT_WAIT
    [seconds, RATE_LIMIT_MAX_WAIT].min
  end

  # @param error [StandardError]
  # @return [Float, nil]
  def contentful_rate_limit_reset_from_headers(error)
    response = error.respond_to?(:response) ? error.response : nil
    headers = response&.respond_to?(:headers) ? response.headers : nil
    return nil unless headers

    value = headers['X-Contentful-RateLimit-Reset'] ||
            headers['x-contentful-ratelimit-reset']
    Float(value, exception: false)
  end

  # @param error [StandardError]
  # @return [Float, nil]
  def contentful_rate_limit_reset_from_message(error)
    match = error.message.match(/Time until reset \(seconds\):\s*(\d+(?:\.\d+)?)/)
    return nil unless match

    Float(match[1], exception: false)
  end

  def safe_read(key)
    Rails.cache.read(key)
  rescue StandardError => e
    Rails.logger.warn("contentful response cache read failed: #{e.class} - #{e.message}")
    nil
  end

  def safe_write(key, payload, expires_in: TTL)
    Rails.cache.write(key, payload, expires_in: expires_in)
  rescue StandardError => e
    Rails.logger.warn("contentful response cache write failed: #{e.class} - #{e.message}")
  end
end

Rails.application.config.to_prepare do
  Contentful::Client.singleton_class.prepend(ContentfulResponseCache)
end
