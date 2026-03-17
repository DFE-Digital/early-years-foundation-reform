#
# Use class-level in memory caching provided by dry-core
# @see https://github.com/dry-rb/dry-core/blob/main/lib/dry/core/cache.rb
#
module Caching
  # Retry Contentful API calls on rate limit
  def with_contentful_retry(max_retries = 3, &block)
    self.class.with_contentful_retry(max_retries, &block)
  end

  # @api private
  def self.extended(klass)
    klass.send :extend, Dry::Core::Cache
    klass.define_singleton_method(:with_contentful_retry) do |max_retries = 3, &block|
      retries = 0
      begin
        block.call
      rescue Contentful::RateLimitExceeded
        if retries < max_retries
          sleep(2)
          retries += 1
          retry
        else
          raise
        end
      end
    end
  end

  # @param key [String] entry id / collection
  # @return [String] timestamped cache key
  def to_key(key)
    "#{key}-#{cache_key}"
  end

  # @return [String] default "initial"
  def cache_key
    cache.get_or_default('cache_key', 'initial')
  end

  # memoise latest release timestamp & prevent cache overload
  # (increase as CMS entries/assets grow)
  #
  # @param timestamp [Time, nil] optional timestamp from webhook payload
  # @return [String] old key
  def reset_cache_key!(timestamp = nil)
    cache.clear if cache.size > 2_000
    new_key = timestamp&.strftime('%d-%m-%Y-%H-%M') || Time.current.strftime('%d-%m-%Y-%H-%M')
    cache.get_and_set('cache_key', new_key)
  end
end
