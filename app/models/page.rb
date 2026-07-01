class Page < ContentfulModel::Base
  extend ::Caching

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
    layout_collection('navigation_items') { home&.pages }
  end

  # @return [Array<Page>]
  def self.footer_items
    layout_collection('footer_items') { footer&.pages }
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

    self.class.fetch_or_store_non_nil self.class.to_key(fields[:image].id) do
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

  # In-process memoized list (per process) with circuit-breaker resilience. The
  # underlying Contentful responses are cached cross-instance at the HTTP layer, so
  # this just avoids re-deserialising within a process. An empty or failed result is
  # never memoized, so it's retried on the next request (and a layout collection
  # never gets stuck empty after a blip).
  #
  # @param key [String]
  # @return [Array<Page>]
  private_class_method def self.layout_collection(key)
    fetch_or_store_non_nil(to_key(key)) do
      with_contentful_resilience(context: "Page.#{key}") { yield&.to_a.presence }
    rescue ::HTTP::TimeoutError, ::Contentful::Error, Caching::CIRCUIT_BREAKER_ERROR
      nil
    end || []
  end
end
