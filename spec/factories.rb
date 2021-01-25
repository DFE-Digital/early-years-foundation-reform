include ActionDispatch::TestProcess

FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "testpassword" }
  end
end

FactoryBot.define do
  factory :content_asset do
    title { "Sample Content Asset" }

    trait :with_avatar do
      avatar { fixture_file_upload(Rails.root.join('spec/fixtures/sample.jpeg'), 'image/jpeg') }
    end
  end
end
