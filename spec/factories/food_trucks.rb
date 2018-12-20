FactoryBot.define do
  factory :food_truck do
    name { Faker::AquaTeenHungerForce.character }
    food_type { Faker::Food.dish }
    contact_name { Faker::Name.first_name }
    phone_number { Faker::PhoneNumber.cell_phone }
    email { Faker::Internet.email }
    logo_image { Faker::Company.logo }
  end
end
