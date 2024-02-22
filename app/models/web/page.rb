module Web
  class Page < ContentfulModel::Base
    extend ::Caching

    self.content_type_id = 'helpPage'

    has_many_nested :pages, root: -> { Web::Page.home }

    def self.home
      by_slug(Rails.configuration.root_slug) || null_object
    end

    def self.null_object
      OpenStruct.new(
        pages: [],
        hero: OpenStruct.new(title: 'no title', body: 'no body'),
      )
    end

    # @param name [String]
    # @return [Web::Page]
    def self.by_slug(slug)
      return find_by(slug: slug.to_s)&.first if Rails.env.production?

      fetch_or_store to_key(slug) do
        find_by(slug: slug.to_s)&.first
      end
    end

    def path
      ["/", parent&.parent&.slug, parent&.slug, slug].join("/").gsub(/home/, "").squeeze("/")
    end

    def breadcrumbs
      list = [self, self&.parent, self&.parent&.parent, self&.parent&.parent&.parent].compact.reverse
      list.shift
      list.each_with_object({ "Home" => "/" }) do |obj, memo|
        memo[obj.title] = obj.path
      end
    end

    def hero
      OpenStruct.new(title: hero_title, body: hero_description)
    end

    def cards?
      page_style == 'cards'
    end

    def navigation?
      page_style == 'side-nav'
    end

    def home?
      placement.match(/home/)
    end

    def footer?
      placement.match(/footer/)
    end

    def self.footer
      fetch_or_store to_key(__method__) do
        load_children(0).find_by(footer: true).order(:heading).load
      end
    end

    # @return [ContentfulModel::Asset]
    def thumbnail
      return OpenStruct.new(url: 'https://placehold.co/380x254/347ca9/FFFFFF/png') if fields[:image].blank?

      fetch_or_store self.class.to_key(fields[:image].id) do
        ContentfulModel::Asset.find(fields[:image].id)
      end
    end
  end
end
