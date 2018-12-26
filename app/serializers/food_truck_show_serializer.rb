class FoodTruckShowSerializer
  include FastJsonapi::ObjectSerializer
  set_type :food_truck
  attributes :name, :food_type, :contact_name, :phone_number, :email, :website, :logo_image
  has_many :cities
end
