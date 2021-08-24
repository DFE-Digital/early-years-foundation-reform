require "faker"

FactoryBot.define do
  factory :user do
    email { [Faker::Internet.user_name, %w[@digital.education.gov.uk @education.gov.uk].sample].join("") }
    password { "TestPassword!@12345" }
    role { "reader" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

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
