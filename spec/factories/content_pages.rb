# spec/factories/content_pages.rb

require "faker"

def sentence_without_puncutation
  Faker::Lorem.sentence(word_count: 4).gsub(",", "").gsub(".", "").gsub("\'", "") + rand(1000).to_s
end

FactoryBot.define do
  factory :content_page do
    title { sentence_without_puncutation }
    subtitle { Faker::Lorem.paragraph }
    seo { "SEO " + Faker::Lorem.sentence(word_count: 4) }
    markdown { Faker::Markdown.headers }
    parent_id { nil }
    position { ContentPage.maximum("position").nil? ? 1 : ContentPage.maximum("position") + 1 }
  end

  trait :with_special_chars_in_title do
    title { Faker::Lorem.sentence(word_count: 4) + "$" }
  end

  trait :top_level do
    parent_id { nil }
  end
end
