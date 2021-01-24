# spec/factories/content_pages.rb

require 'faker'

FactoryBot.define do
  factory :content_page do
    title { Faker::Lorem.words(number: 4).join(' ') }
    subtitle { Faker::Lorem.paragraph }
    slug { "Slug " + Faker::Lorem.words(number: 4).join(' ') }
    seo { "SEO " + Faker::Lorem.words(number: 4).join(' ') }
    markdown { Faker::Markdown.headers }
  end
end
