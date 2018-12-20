class FoodTruck < ApplicationRecord
    validates_presence_of :name, :food_type, :contact_name, :phone_number, :email
    has_many :truck_cities
end
