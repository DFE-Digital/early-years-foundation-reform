# Caches raw Contentful API responses (JSON) in Rails.cache (Redis), keyed by URL —
# the Ruby equivalent of check-an-early-years-qualification's CachingHandler.
#
# WHY at the HTTP layer, not the model layer: ContentfulModel objects hold a live
# client and lazily resolve fields, so they do NOT survive Marshal -> Redis ->
# unmarshal (you get back an object with nil fields). The raw JSON response is just a
# String — Redis stores it perfectly, and the gem rebuilds fresh, fully-working
# objects from it on every cache hit. This gives genuine cross-instance content
# caching without the marshalling wall.
require 'uri'

module ContentfulResponseCache
  TRACER_NAME = 'contentful-client'.freeze

  # Stand-in for the `http` gem's response, exposing only what Contentful::Response
  # reads off it: #status, #to_s (body) and #headers.
  CachedResponse = Struct.new(:status, :body, :headers) do
    delegate :to_s, to: :body
  end

  TTL = 1.hour
  KEY_PREFIX = 'contentful:resp'.freeze
  DELIVERY_HOST = 'cdn.contentful.com'.freeze # delivery API only; never preview/management

  # Overrides Contentful::Client.get_http (a stateless class method).
  def get_http(url, query, headers = {}, proxy = {}, timeout = {})
    tracer.in_span('contentful.http.get', kind: :client) do |span|
      uri = URI.parse(url.to_s)
      span.set_attribute('http.method', 'GET')
      span.set_attribute('http.url', url.to_s)
      span.set_attribute('peer.service', 'contentful')
      span.set_attribute('server.address', uri.host.to_s)
      span.set_attribute('url.path', uri.path.to_s)

      return super unless cacheable?(url)

      key = response_key(url, query)

      if (hit = safe_read(key))
        span.set_attribute('cache.hit', true)
        span.set_attribute('http.status_code', hit[:status].to_i)
        return CachedResponse.new(hit[:status], hit[:body], hit[:headers])
      end

      span.set_attribute('cache.hit', false)

      raw = super
      span.set_attribute('http.status_code', raw.status.to_i)
      return raw unless raw.status == 200 # don't cache errors

      payload = {
        status: raw.status,
        body: raw.to_s,
        headers: { 'Content-Encoding' => raw.headers['Content-Encoding'] },
      }
      safe_write(key, payload)
      CachedResponse.new(payload[:status], payload[:body], payload[:headers])
    rescue StandardError => e
      span.record_exception(e)
      span.status = OpenTelemetry::Trace::Status.error("#{e.class}: #{e.message}")
      raise
    end
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

  def safe_write(key, payload)
    Rails.cache.write(key, payload, expires_in: TTL)
  rescue StandardError => e
    Rails.logger.warn("contentful response cache write failed: #{e.class} - #{e.message}")
  end

  def tracer
    OpenTelemetry.tracer_provider.tracer(TRACER_NAME)
  end
end

Rails.application.config.to_prepare do
  Contentful::Client.singleton_class.prepend(ContentfulResponseCache)
end
