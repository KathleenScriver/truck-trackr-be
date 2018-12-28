class OpenDate < ApplicationRecord
  validates_presence_of :date
  validates_inclusion_of :booked?, in: [true, false]
  belongs_to :food_truck
end
