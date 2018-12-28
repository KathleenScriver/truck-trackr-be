Brewery.destroy_all
FoodTruck.destroy_all

10.times do
  Brewery.create(
                  name: Faker::Company.name,
                  address: Faker::Address.full_address,
                  contact_name: Faker::Name.name,
                  phone: Faker::PhoneNumber.phone_number,
                  email: Faker::Internet.email,
                  website: Faker::Internet.url
                )
end

12.times do
  FoodTruck.create(
                    name: Faker::AquaTeenHungerForce.character,
                    food_type: Faker::Food.dish,
                    contact_name: Faker::Name.first_name,
                    phone: Faker::PhoneNumber.cell_phone,
                    email: Faker::Internet.email,
                    logo_image: Faker::Company.logo
                  )
end

food_truck_1 = FoodTruck.first

5.times do
  food_truck_1.open_dates.create(
                                  date: Faker::Date.forward(120),
                                  booked?: Faker::Boolean.boolean
                                )
end
