# spec/factories/content_pages.rb

require "faker"

FactoryBot.define do
  factory :content_page do
    title { Faker::Lorem.sentence(word_count: 4) }
    subtitle { Faker::Lorem.paragraph }
    slug { "Slug " + Faker::Lorem.sentence(word_count: 4) }
    seo { "SEO " + Faker::Lorem.sentence(word_count: 4) }
    markdown { Faker::Markdown.headers }
  end
end
