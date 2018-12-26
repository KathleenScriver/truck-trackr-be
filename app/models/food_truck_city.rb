class FoodTruckCity < ApplicationRecord
  belongs_to :food_truck
  belongs_to :city
end
