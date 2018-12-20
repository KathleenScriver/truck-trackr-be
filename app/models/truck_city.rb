class TruckCity < ApplicationRecord
  validates_presence_of :city
  belongs_to :food_truck
end
