# Persisted webhook payloads from CMS
#
class Release < ApplicationRecord
  # @return [nil, String]
  def self.cache_key
    last&.time&.strftime('%d-%m-%Y-%H-%M')
  end

  default_scope { order(time: :asc) }
end
