FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password { "testpassword" }
    role { "editor" }
  end

  trait :editor do
    role { "editor" }
  end

  trait :reader do
    role { "reader" }
  end
end
