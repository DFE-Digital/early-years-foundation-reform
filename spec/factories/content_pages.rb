# spec/factories/content_pages.rb

require "faker"

def sentence_without_puncutation
  "#{Faker::Lorem.words(number: 4).join(' ')}#{rand(1000)}"
end

FactoryBot.define do
  factory :content_page do
    title { sentence_without_puncutation }
    markdown { Faker::Markdown.headers }
    parent_id { nil }
    position { ContentPage.maximum("position").nil? ? 1 : ContentPage.maximum("position") + 1 }
  end

  trait :with_special_chars_in_title do
    title { "#{Faker::Lorem.sentence(word_count: 4)}$" }
  end

  trait :top_level do
    parent_id { nil }
  end

  trait :hyphen_in_title do
    title { "#{Faker::Lorem.word}-#{Faker::Lorem.word}" }
  end

  trait :comma_in_title do
    title { "#{Faker::Lorem.word},#{Faker::Lorem.word}" }
  end

  trait :colon_in_title do
    title { "#{Faker::Lorem.word}:#{Faker::Lorem.word}" }
  end

  trait :round_braces_in_title do
    title { "#{Faker::Lorem.word}(#{Faker::Lorem.word})" }
  end

  trait :two_hyphens_and_a_space_in_title do
    title { "#{Faker::Lorem.word}-#{Faker::Lorem.word} #{Faker::Lorem.word}-#{Faker::Lorem.word}" }
  end
end
