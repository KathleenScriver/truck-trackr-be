class BreweryEventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :truck_booked?
end
