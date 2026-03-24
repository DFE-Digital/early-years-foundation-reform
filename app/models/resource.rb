class Resource < ContentfulModel::Base
  extend ::Caching

  self.content_type_id = 'helpResource'

  belongs_to_many :pages

  # @param name [String]
  # @return [Resource]
  def self.by_name(name)
    fetch_or_store to_key(name) do
      find_by(name: name.to_s).first
    rescue ::HTTP::TimeoutError, ::Contentful::Error => e
      Rails.logger.error("Contentful timeout or error in Resource.by_name('#{name}'): #{e.class} - #{e.message}")
      nil
    end
  end
end
