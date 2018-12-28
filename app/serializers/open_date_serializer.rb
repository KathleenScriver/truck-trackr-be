class OpenDateSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :date, :booked?
end
