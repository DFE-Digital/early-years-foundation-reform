#
# Class-level caching split by what is marshal-safe:
#
#   * Cross-instance content caching lives at the HTTP layer — raw Contentful API
#     responses (JSON) are cached in Redis (see
#     config/initializers/contentful_response_cache.rb). ContentfulModel objects
#     themselves are NOT cached in Redis because they hold a live client and don't
#     survive Marshal -> Redis -> unmarshal (you get back nil fields).
#   * Object memoization (fetch_or_store / fetch_or_store_non_nil) is in-process
#     only, via dry-core, so the live objects are never serialised.
#   * The cache_key version pointer and the Contentful circuit breaker ARE shared
#     across instances via Redis — both are plain, marshal-safe values.
#
# @see https://github.com/dry-rb/dry-core/blob/main/lib/dry/core/cache.rb
#
module Caching
  CIRCUIT_BREAKER_ERROR = Class.new(StandardError)
  CIRCUIT_FAILURE_THRESHOLD = 5
  CIRCUIT_OPEN_DURATION = 60.seconds
  RETRY_BASE_DELAY = 0.25

  # @api private
  def self.extended(klass)
    klass.send :extend, Dry::Core::Cache
  end

  # In-process memoization (per process). See the module comment for why object
  # caches are not stored in Redis.
  #
  # @param key [String]
  def fetch_or_store(key, &block)
    cache.fetch_or_store(key, &block)
  end

  # @param key [String] entry id / collection
  # @return [String] timestamped cache key
  def to_key(key)
    "#{key}-#{cache_key}"
  end

  # @return [String] default "initial"
  def cache_key
    if shared_cache?
      Rails.cache.fetch(shared_key('cache_key'), expires_in: 30.days) { 'initial' }
    else
      cache.get_or_default('cache_key', 'initial')
    end
  end

  # As #fetch_or_store, but never memoizes a nil result, so a transient Contentful
  # failure (which returns nil) is retried on the next call rather than remembered.
  #
  # @param args [Array<Object>] cache key parts
  # @return [Object, nil]
  def fetch_or_store_non_nil(*args)
    key = args.hash
    return cache[key] if cache.key?(key)

    result = yield
    cache[key] = result unless result.nil?
    result
  end

  # memoise latest release timestamp & prevent cache overload
  # (increase as CMS entries/assets grow)
  #
  # @param timestamp [Time, nil] optional timestamp from webhook payload
  # @return [String] old key
  def reset_cache_key!(timestamp = nil)
    new_key = timestamp&.strftime('%d-%m-%Y-%H-%M') || Time.current.strftime('%d-%m-%Y-%H-%M')

    if shared_cache?
      Rails.cache.write(shared_key('cache_key'), new_key, expires_in: 30.days)
    else
      cache.clear if cache.size > 2_000
      cache.get_and_set('cache_key', new_key)
    end
  end

  # @param context [String]
  # @param max_retries [Integer]
  def with_contentful_resilience(context:, max_retries: 2)
    raise CIRCUIT_BREAKER_ERROR, "Circuit open for #{name}" if circuit_open?

    attempts = 0

    begin
      attempts += 1
      result = yield
      clear_circuit_breaker!
      result
    rescue ::HTTP::TimeoutError, ::Contentful::Error => e
      if attempts <= max_retries && retryable_contentful_error?(e)
        contentful_sleep(retry_delay_seconds(error: e, attempt: attempts))
        retry
      end

      register_circuit_failure!
      Rails.logger.error("Contentful error in #{context}: #{e.class} - #{e.message}")
      raise
    end
  end

  # Extracted for test stubbing.
  # @param seconds [Float]
  def contentful_sleep(seconds)
    sleep(seconds)
  end

  # @param error [StandardError]
  # @param attempt [Integer]
  # @return [Float]
  def retry_delay_seconds(error:, attempt:)
    header_retry_after = retry_after_from_headers(error)
    return header_retry_after if header_retry_after

    exponential = RETRY_BASE_DELAY * (2**(attempt - 1))
    jitter = rand * 0.2
    exponential + jitter
  end

private

  def shared_cache?
    Rails.cache.present? && !Rails.cache.is_a?(ActiveSupport::Cache::NullStore)
  end

  # @param key [String]
  # @return [String]
  def shared_key(key)
    "#{name.underscore}:#{key}"
  end

  def circuit_open?
    return false unless shared_cache?

    Rails.cache.read(shared_key('contentful_circuit_open')).present?
  end

  def register_circuit_failure!
    return unless shared_cache?

    failures = Rails.cache.increment(shared_key('contentful_failure_count'), 1, expires_in: CIRCUIT_OPEN_DURATION)
    return unless failures.to_i >= CIRCUIT_FAILURE_THRESHOLD

    Rails.cache.write(shared_key('contentful_circuit_open'), true, expires_in: CIRCUIT_OPEN_DURATION)
  end

  def clear_circuit_breaker!
    return unless shared_cache?

    Rails.cache.delete(shared_key('contentful_failure_count'))
    Rails.cache.delete(shared_key('contentful_circuit_open'))
  end

  def retryable_contentful_error?(error)
    return true if error.is_a?(::HTTP::TimeoutError)

    status_code = contentful_status_code(error)
    status_code == 429 || status_code.to_i >= 500
  end

  # @param error [StandardError]
  # @return [Integer, nil]
  def contentful_status_code(error)
    return error.response.code.to_i if error.respond_to?(:response) && error.response.respond_to?(:code)

    return error.status_code.to_i if error.respond_to?(:status_code)

    return Regexp.last_match(1).to_i if error.message =~ /\b(\d{3})\b/

    nil
  end

  # @param error [StandardError]
  # @return [Float, nil]
  def retry_after_from_headers(error)
    return nil unless error.respond_to?(:response)

    response = error.response
    headers = response.respond_to?(:headers) ? response.headers : nil
    return nil unless headers

    value = headers['Retry-After'] || headers['retry-after']
    return nil if value.blank?

    seconds = Float(value, exception: false)
    seconds&.positive? ? seconds : nil
  end
end
