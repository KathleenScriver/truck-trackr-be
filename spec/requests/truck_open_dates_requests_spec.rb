require "rails_helper"

describe("Truck OpenDates API") do
  describe("GET /food_trucks/:id/open_dates") do
    it("returns list of open_dates for specified truck") do
      food_truck = create(:food_truck)
      open_date = create_list(:open_date, 5, food_truck_id: food_truck )

      food_truck_2 = create(:food_truck)
      other_open_date = create(:open_date, food_truck_id: food_truck_2)


      get "/api/v1/food_truck/#{food_truck.id}/open_dates"

      all_open_dates = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(all_open_dates).to have_key(:data)
      expect(all_open_dates[:data].count).to eq(5)
      expect(all_open_dates[:data]).to have_key(:id)
      expect(all_open_dates[:data][:id]).to eq(food_truck.id)
      expect(all_open_dates[:data]).to have_key(:attributes)
      expect(all_open_dates[:data][:attributes]).to have_key(:id)
      expect(all_open_dates[:data][:attributes]).to have_key(:date)
      expect(all_open_dates[:data][:attributes]).to have_key(:booked?)
    end
  end
end
