require "faker"

FactoryBot.define do
  factory :article do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    markdown { "# Fake title - #{Faker::Lorem.word}" }
    traits_for_enum :status, Article.statuses.keys

    trait :complete do
      featured_image { Rack::Test::UploadedFile.new("spec/fixtures/files/sample.jpeg", "image/jpeg") }
      thumbnail_image { Rack::Test::UploadedFile.new("spec/fixtures/files/sample.jpeg", "image/jpeg") }
      featured_alt_text { Faker::Lorem.sentence }
      thumbnail_alt_text { Faker::Lorem.sentence }
    end
  end
end
