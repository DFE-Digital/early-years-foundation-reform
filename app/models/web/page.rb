module Web
  class Page < ContentfulModel::Base
    extend ::Caching

    self.content_type_id = 'helpPage'

    has_many_nested :pages, root: -> { Web::Page.home }

    def self.home
      find_by(slug: Rails.configuration.root_slug).first
    end

    # @param name [String]
    # @return [Web::Page]
    def self.by_slug(slug)
      find_by(slug: slug.to_s).first
    end

    def path
      ["/", parent&.parent&.slug, parent&.slug, slug].join("/").squeeze("/")
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

    # @return [ContentfulModel::Asset]
    def thumbnail
      return OpenStruct.new(url: 'https://placehold.co/380x254/347ca9/FFFFFF/png') if fields[:image].blank?

      fetch_or_store self.class.to_key(fields[:image].id) do
        ContentfulModel::Asset.find(fields[:image].id)
      end
    end
  end
end
