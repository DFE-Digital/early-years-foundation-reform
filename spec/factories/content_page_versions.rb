FactoryBot.define do
  factory :content_page_version do
    content_page # Note that another content page version will be created on creating this content page
    title { Faker::Commerce.product_name }
    markdown { Faker::Lorem.paragraph }
    author { Faker::Name.name }
  end
end
