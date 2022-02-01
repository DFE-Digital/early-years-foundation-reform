FactoryBot.define do
  factory :content_asset do
    title { Faker::Lorem.sentence(word_count: 4).to_s }
    alt_text { Faker::Lorem.sentence(word_count: 4).to_s }
    content_page_id { rand(1..100) }
    asset_file { Rack::Test::UploadedFile.new("spec/fixtures/files/sample.jpeg", "image/jpeg") }
  end
end
