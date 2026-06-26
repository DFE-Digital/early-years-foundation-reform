class Page < ContentfulModel::Base
  extend ::Caching

  LAYOUT_CACHE_TTL = 5.minutes
  LAYOUT_STALE_TTL = 30.minutes
  LAYOUT_REFRESH_LOCK_TTL = 30.seconds

  self.content_type_id = 'helpPage'

  has_many_nested :pages, root: -> { Page.home }

  # @return [Page]
  def self.home
    by_slug 'home'
  end

  # @return [Page]
  def self.footer
    by_slug('footer')
  rescue ::HTTP::TimeoutError, ::Contentful::Error => e
    Rails.logger.error("Contentful timeout or error in Page.footer: #{e.class} - #{e.message}")
    nil
  end

  # @param slug [String]
  # @return [Page]
  def self.by_slug(slug)
    fetch_or_store_non_nil to_key(slug) do
      with_contentful_resilience(context: "Page.by_slug('#{slug}')") do
        find_by(slug: slug.to_s)&.first
      end
    rescue ::HTTP::TimeoutError, ::Contentful::Error, Caching::CIRCUIT_BREAKER_ERROR
      nil
    end
  end

  # @return [Array<Page>]
  def self.navigation_items
    read_collection_with_stale_fallback('navigation_items') do
      home&.pages.to_a
    end
  end

  # @return [Array<Page>]
  def self.footer_items
    read_collection_with_stale_fallback('footer_items') do
      footer&.pages.to_a
    end
  end

  # @param key [String]
  # @return [void]
  def self.refresh_layout_collection!(key)
    write_collection_caches(key, with_contentful_resilience(context: "Page.refresh_layout_collection!(#{key})") do
      case key
      when 'navigation_items'
        home&.pages.to_a
      when 'footer_items'
        footer&.pages.to_a
      else
        []
      end
    end)
  rescue ::HTTP::TimeoutError, ::Contentful::Error, Caching::CIRCUIT_BREAKER_ERROR
    nil
  ensure
    release_refresh_lock(key)
  end

  # @return [String]
  def path
    root_slug = root&.slug
    list = ['/', parent&.parent&.slug, parent&.slug, slug].join('/')
    return list.squeeze('/') if root_slug.blank?

    list.gsub(%r{/#{root_slug}/}, '').squeeze('/')
  end

  # @return [String] TODO: update model field with default and snake_case values
  def to_partial_path
    page_style ? page_style.underscore : 'default'
  end

  # @return [Hash{String=>String}]
  def breadcrumbs
    root = { 'Home' => '/' }
    list = [self, parent, parent&.parent, parent&.parent&.parent].compact.reverse
    list.shift
    list.each_with_object(root) do |page, crumbs|
      crumbs[page.title] = page.path
    end
  end

  # @return [Boolean]
  def cards?
    page_style == 'cards'
  end

  # @return [Boolean]
  def navigation?
    page_style == 'side-nav'
  end

  # @return [ContentfulModel::Asset, nil]
  def thumbnail
    return if fields[:image].blank?

    self.class.fetch_or_store_non_nil self.class.to_key(fields[:image].id), expires_in: 30.minutes do
      self.class.with_contentful_resilience(context: "Page#thumbnail('#{slug}')") do
        ContentfulModel::Asset.find(fields[:image].id)
      end
    end
  rescue ::HTTP::TimeoutError, ::Contentful::Error, Caching::CIRCUIT_BREAKER_ERROR
    nil
  end

  # @return [Boolean] child of the 'footer' page
  def footer?
    parent&.slug == 'footer'
  end

  # @return [Boolean]
  def tier1?
    parent&.root?
  end

  # @return [Boolean]
  def tier2?
    parent&.tier1?
  end

  # @return [Boolean]
  def tier3?
    parent&.tier2?
  end

  def main_content_link
    if tier1? || tier2? || tier3?
      [path, '#main-content'].join('')
    else
      '#main-content'
    end
  end

  # @return [Date]
  def created_at
    released_at || super
  end

  private_class_method def self.read_collection_with_stale_fallback(key, &block)
    fresh_key = to_key("#{key}:fresh")
    stale_key = to_key("#{key}:stale")

    fresh = Rails.cache.read(fresh_key)
    return fresh if fresh.present?

    stale = Rails.cache.read(stale_key)
    if stale.present?
      enqueue_refresh(key)
      return stale
    end

    data = with_contentful_resilience(context: "Page.#{key}", &block)
    write_collection_caches(key, data)
    data
  rescue ::HTTP::TimeoutError, ::Contentful::Error, Caching::CIRCUIT_BREAKER_ERROR
    stale || []
  end

  private_class_method def self.write_collection_caches(key, data)
    payload = data || []
    ttl_with_jitter = LAYOUT_CACHE_TTL + rand(15..75).seconds

    Rails.cache.write(to_key("#{key}:fresh"), payload, expires_in: ttl_with_jitter)
    Rails.cache.write(to_key("#{key}:stale"), payload, expires_in: LAYOUT_STALE_TTL)
  end

  private_class_method def self.enqueue_refresh(key)
    return unless acquire_refresh_lock(key)

    ContentfulLayoutCacheRefreshJob.perform_later(key)
  rescue StandardError => e
    Rails.logger.warn("Unable to queue ContentfulLayoutCacheRefreshJob for #{key}: #{e.class} - #{e.message}")
    release_refresh_lock(key)
  end

  private_class_method def self.acquire_refresh_lock(key)
    Rails.cache.write(refresh_lock_key(key), true, expires_in: LAYOUT_REFRESH_LOCK_TTL, unless_exist: true)
  end

  private_class_method def self.release_refresh_lock(key)
    Rails.cache.delete(refresh_lock_key(key))
  end

  private_class_method def self.refresh_lock_key(key)
    to_key("#{key}:refresh_lock")
  end
end
