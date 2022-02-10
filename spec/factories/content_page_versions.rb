FactoryBot.define do
  factory :content_page_version do
    content_page # Note that another content page version will be created on creating this content page
    title { Faker::Commerce.product_name }
    content_list { Faker::Lorem.paragraph }
    markdown { Faker::Lorem.paragraph }
    author { Faker::Name.name }
    description { Faker::Lorem.paragraph }
  end

  trait :content_list_empty do
    content_list { nil }
  end
end
