# spec/factories/content_blocks.rb

require "faker"

FactoryBot.define do
  factory :content_block do
    name { "#{Faker::Lorem.word}" }
    description { "#{Faker::Lorem.sentence(word_count: 10)}" }
    markdown { "# Fake title - #{Faker::Lorem.word}" }
 end
end
