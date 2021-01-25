FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "testpassword" }
  end
end

FactoryBot.define do
  factory :content_asset do
    title { "Sample Content Asset" }
  end
end