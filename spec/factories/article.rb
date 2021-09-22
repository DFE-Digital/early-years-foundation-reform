require "faker"

def sentence_without_puncutation
  "#{Faker::Lorem.words(number: 4).join(' ')}#{rand(1000)}"
end

FactoryBot.define do
  factory :article do
    title { sentence_without_puncutation }
    description { sentence_without_puncutation }
    markdown { "# Fake title - #{Faker::Lorem.word}" }
    featured_image { Rack::Test::UploadedFile.new("spec/fixtures/sample.jpeg", "image/jpeg") }
    thumbnail_image { Rack::Test::UploadedFile.new("spec/fixtures/sample.jpeg", "image/jpeg") }
  end
end
