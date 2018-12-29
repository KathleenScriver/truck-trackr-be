class BreweryShowSerializer
  include FastJsonapi::ObjectSerializer
  set_type :brewery
  attributes :name, :address, :contact_name, :phone, :email, :website, :logo_image
  has_many :brewery_events
end
