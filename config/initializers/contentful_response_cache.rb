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
  KEY_PREFIX = 'contentful:resp'.freeze
  STALE_KEY_PREFIX = 'contentful:resp:stale'.freeze
  DELIVERY_HOST = 'cdn.contentful.com'.freeze # delivery API only; never preview/management

  # Overrides Contentful::Client.get_http (a stateless class method).
  def get_http(url, query, headers = {}, proxy = {}, timeout = {})
    return super unless cacheable?(url)

    key = response_key(url, query)
    stale_key = stale_response_key(url, query)

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
  rescue ::HTTP::TimeoutError, ::Contentful::Error => e
    if (stale_hit = safe_read(stale_key))
      Rails.logger.warn("contentful response cache stale fallback used: #{e.class} - #{e.message}")
      return CachedResponse.new(stale_hit[:status], stale_hit[:body], stale_hit[:headers])
    end

    raise
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

  def content_version
    Page.cache_key
  rescue StandardError
    'initial'
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
