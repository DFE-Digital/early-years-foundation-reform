FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "testpassword" }
  end
end

FactoryBot.define do
  factory :content_asset do
    title { "Title" }
    alt_text { "Sample alt text" }
    asset_file { Rack::Test::UploadedFile.new("spec/fixtures/sample.jpeg", "image/jpeg") }
  end
end
