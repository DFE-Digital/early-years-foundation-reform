require "securerandom"

class FlipperSession
  SESSION_KEY = "_flipper_id".freeze

  def self.session_key
    SESSION_KEY
  end

  def self.generate_id
    SecureRandom.uuid
  end

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def flipper_id
    "FlipperSession/#{@id}"
  end
end
