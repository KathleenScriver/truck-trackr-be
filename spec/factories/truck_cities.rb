FactoryBot.define do
  factory :truck_city do
    city { Faker::Address.city }
    food_truck { nil }
  end
end
