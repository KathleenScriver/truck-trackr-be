class TruckCitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :city
  belongs_to :food_truck
end
