require "faker"

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "TestPassword!@12345" }
    role { "reader" }

    factory :admin do
      role { "admin" }
    end

    factory :editor do
      role { "editor" }
    end

    factory :reader do
      role { "reader" }
    end
  end
end
