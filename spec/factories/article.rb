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
    featured_alt_text { sentence_without_puncutation }
    thumbnail_alt_text { sentence_without_puncutation }
  end
end
