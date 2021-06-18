# spec/factories/content_blocks.rb
require "faker"

FactoryBot.define do
  factory :content_block do
    name { Faker::Lorem.word.to_s }
    description { Faker::Lorem.sentence(word_count: 10).to_s }
    markdown { "Fake title - #{Faker::Lorem.word}" }
  end
end
