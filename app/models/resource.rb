class Resource < ContentfulModel::Base
  extend ::Caching

  self.content_type_id = 'helpResource'

  belongs_to_many :pages

  # @param name [String]
  # @return [Resource]
  def self.by_name(name)
    fetch_or_store to_key(name) do
      find_by(name: name.to_s).first
    end
  end
end
