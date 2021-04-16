FactoryBot.define do
  factory :content_asset do
    title { Faker::Lorem.sentence(word_count: 4).to_s }
    alt_text { Faker::Lorem.sentence(word_count: 4).to_s }
    asset_file { Rack::Test::UploadedFile.new("spec/fixtures/sample.jpeg", "image/jpeg") }
  end
end
