# spec/factories/tickets.rb

FactoryBot.define do
    factory :ticket do
      event
      buyer_name { Faker::Name.name }
      quantity { Faker::Number.between(from: 1, to: 10) }
      total_price { Faker::Commerce.price }
  
    end
  end