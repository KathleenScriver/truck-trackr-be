class BreweryShowSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :address, :contact_name, :phone, :email, :website
end
