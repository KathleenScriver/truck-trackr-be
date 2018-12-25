class FoodTruckIndexSerializer
  include FastJsonapi::ObjectSerializer
  set_type :food_truck
  attributes :name
end
