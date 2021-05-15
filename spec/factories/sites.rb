# spec/factories/sites.rb

require "faker"

FactoryBot.define do
  factory :site do
    name { Faker::Restaurant.name }
    subdomain { name.parameterize.underscore }
  end
end
