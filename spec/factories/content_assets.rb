FactoryBot.define do
  factory :content_asset do
    title { Faker::Lorem.sentence(word_count: 4).to_s }
    alt_text { Faker::Lorem.sentence(word_count: 4).to_s }
    page_name { Faker::Lorem.sentence(word_count: 4).to_s }
    asset_file { Rack::Test::UploadedFile.new("spec/fixtures/files/sample.jpeg", "image/jpeg") }
  end
end
