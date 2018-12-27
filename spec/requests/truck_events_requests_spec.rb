require "rails_helper"

describe("Truck Events API") do
  describe("GET /food_trucks/:id/events") do
    it("returns list of events for specified truck") do
      food_truck = create(:food_truck)

      open_date = create_list(:open_date, 5, food_truck_id: food_truck )

      get "/api/v1/food_truck/#{food_truck.id}/events"

      
    end
  end
end
