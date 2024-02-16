module Web
  class Page < ContentfulModel::Base
    extend ::Caching

    self.content_type_id = 'page'

    has_many_nested :pages, root: -> { Web::Page.home }

    def self.home
      find_by(slug: Rails.configuration.root_slug).first
    end

    # @param name [String]
    # @return [Web::Page]
    def self.by_slug(slug)
      find_by(slug: slug.to_s).first
    end

    def cards?
      page_style == 'cards'
    end

    def navigation?
      page_style == 'navigation'
    end

    # @return [Web::Resource]
    def hero
      return nil if fields[:page_abstract].blank?

      fetch_or_store self.class.to_key(fields[:page_abstract].id) do
        Web::Resource.find(fields[:page_abstract].id)
      end
    end

    # @return [ContentfulModel::Asset]
    def thumbnail
      return '//external-image-resource-placeholder' if fields[:image].blank?

      fetch_or_store self.class.to_key(fields[:image].id) do
        ContentfulModel::Asset.find(fields[:image].id)
      end
    end
  end
end