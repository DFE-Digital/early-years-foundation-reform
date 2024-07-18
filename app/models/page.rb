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
    by_slug 'footer'
  end

  # @param slug [String]
  # @return [Page]
  def self.by_slug(slug)
    fetch_or_store to_key(slug) do
      find_by(slug: slug.to_s)&.first
    end
  end

  # @return [String]
  def path
    root = footer? ? self.class.footer.slug : self.class.home.slug
    list = ['/', parent&.parent&.slug, parent&.slug, slug].join('/')
    list.gsub(%r{/#{root}/}, '').squeeze('/')
  end

  # @return [String] TODO: update model field with default and snake_case values
  def to_partial_path
    page_style ? page_style.underscore : 'default'
  end

  # @return [Hash{String=>String}]
  def breadcrumbs
    root = { 'Home' => '/' }
    list = [self, self&.parent, self&.parent&.parent, self&.parent&.parent&.parent].compact.reverse
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

  # @return [ContentfulModel::Asset]
  def thumbnail
    return ::OpenStruct.new(url: 'https://placehold.co/380x254/347ca9/FFFFFF/png') if fields[:image].blank?

    fetch_or_store self.class.to_key(fields[:image].id) do
      ContentfulModel::Asset.find(fields[:image].id)
    end
  end

  # @return [Boolean] child of the 'footer' page
  def footer?
    parent.eql?(self.class.footer)
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

  def created_at
    released_at || super
  end
end
