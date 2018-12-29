FactoryBot.define do
  factory :brewery_event do
    date { Faker::Date.forward(120) }
    truck_booked? { Faker::Boolean.boolean }
    brewery
  end
end
