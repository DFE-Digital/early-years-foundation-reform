#
# Use class-level in memory caching provided by dry-core
# @see https://github.com/dry-rb/dry-core/blob/main/lib/dry/core/cache.rb
#
module Caching
  # @api private
  def self.extended(klass)
    klass.send :extend, Dry::Core::Cache
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
  # @return [String] old key
  def reset_cache_key!
    cache.clear if cache.size > 2_000
    cache.get_and_set('cache_key', Release.cache_key || cache_key)
  end
end
