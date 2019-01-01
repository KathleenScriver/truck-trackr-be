class FoodTruck < ApplicationRecord
    validates_presence_of :name, :food_type, :contact_name, :phone, :email
    validates :uid, presence: true, uniqueness: true
    has_many :food_truck_cities
    has_many :cities, through: :food_truck_cities
    has_many :open_dates
end
