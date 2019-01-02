class FoodTruck < ApplicationRecord
    validates_presence_of :name, :food_type, :contact_name, :phone, :email
    has_many :food_truck_cities, dependent: :destroy
    has_many :cities, through: :food_truck_cities
    has_many :open_dates, dependent: :destroy
end
