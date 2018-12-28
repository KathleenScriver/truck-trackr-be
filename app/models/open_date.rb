class OpenDate < ApplicationRecord
  validates_presence_of :date, :booked?
  belongs_to :food_truck
end
