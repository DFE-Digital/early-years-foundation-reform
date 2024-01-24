class Asset
  require 'contentful'

  attr_reader :object

  delegate :title, :url, to: :object

  def initialize(id:)
    @object = Asset.client.asset(id)
  end

  def self.client
    @client ||= Contentful::Client.new(
      space: Rails.configuration.contentful_space,
      access_token: Rails.configuration.contentful_delivery_access_token,
      environment: Rails.configuration.contentful_environment,
      dynamic_entries: :auto, # Enables Content Type caching.
    )
  end
end
