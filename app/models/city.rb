class City < ApplicationRecord
    validates_presence_of :name
    has_many :food_truck_cities
    has_many :food_trucks, through: :food_truck_cities
end
