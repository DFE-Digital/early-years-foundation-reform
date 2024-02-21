module Web
  class Resource < ContentfulModel::Base
    extend ::Caching

    self.content_type_id = 'helpResource'

    belongs_to_many :web_page

    # @param name [String]
    # @return [Web::Resource]
    def self.by_name(name)
      fetch_or_store to_key(name) do
        find_by(name: name.to_s).first
      end
    end

    # @return [Array<Page::Resource]
    def self.ordered
      fetch_or_store to_key("#{name}.__method__") do
        limit(1_000).order(:name).load.to_a
      end
    end
  end
end
