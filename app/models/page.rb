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
      find_by(slug: slug.to_s)&.first
    rescue ::HTTP::TimeoutError, ::Contentful::Error => e
      Rails.logger.error("Contentful timeout or error in Page.by_slug('#{slug}'): #{e.class} - #{e.message}")
      nil
    end
  end

  # @return [Array<Page>]
  def self.navigation_items
    fetch_or_store to_key('navigation_items') do
      home&.pages.to_a
    end
  rescue ::HTTP::TimeoutError, ::Contentful::Error => e
    Rails.logger.error("Contentful timeout or error in Page.navigation_items: #{e.class} - #{e.message}")
    []
  end

  # @return [Array<Page>]
  def self.footer_items
    fetch_or_store to_key('footer_items') do
      footer&.pages.to_a
    end
  rescue ::HTTP::TimeoutError, ::Contentful::Error => e
    Rails.logger.error("Contentful timeout or error in Page.footer_items: #{e.class} - #{e.message}")
    []
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

    fetch_or_store self.class.to_key(fields[:image].id) do
      ContentfulModel::Asset.find(fields[:image].id)
    end
  rescue ::HTTP::TimeoutError, ::Contentful::Error => e
    Rails.logger.error("Contentful timeout or error in Page#thumbnail for '#{slug}': #{e.class} - #{e.message}")
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
end
