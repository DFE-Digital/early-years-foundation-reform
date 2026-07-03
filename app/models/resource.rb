class Resource < ContentfulModel::Base
  extend ::Caching

  self.content_type_id = 'helpResource'

  belongs_to_many :pages

  # @param name [String]
  # @return [Resource]
  def self.by_name(name)
    fetch_or_store_non_nil to_key(name) do
      with_contentful_resilience(context: "Resource.by_name('#{name}')") do
        find_by(name: name.to_s).first
      end
    rescue ::HTTP::TimeoutError, ::Contentful::Error, Caching::CIRCUIT_BREAKER_ERROR
      nil
    end
  end
end
