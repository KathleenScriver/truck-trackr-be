class FoodTruckSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :food_type, :contact_name, :phone_number, :email, :logo_image
  has_many :truck_cities
end
