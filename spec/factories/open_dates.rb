FactoryBot.define do
  factory :open_date do
    date { Faker::Date.forward(120) }
    booked? { Faker::Boolean.boolean }
    food_truck
  end
end
