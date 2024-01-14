FactoryBot.define do
    factory :event do
        name { Faker::Lorem.words(number: 3).join(' ') }
        description { Faker::Lorem.sentence }
        location { Faker::Address.city }
        start_time { Faker::Time.between(from: DateTime.now, to: DateTime.now + 30) }
        end_time { Faker::Time.between(from: DateTime.now + 31, to: DateTime.now + 60) }
        ticket_price { Faker::Commerce.price }
    end
  end