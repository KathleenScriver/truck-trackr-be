class BreweryEvent < ApplicationRecord
  validates_presence_of :date
  validates_inclusion_of :truck_booked?, in: [true, false]
  belongs_to :brewery
end
