class FoodTruckOpenDatesSerializer
  include FastJsonapi::ObjectSerializer
  has_many :open_dates 
end
