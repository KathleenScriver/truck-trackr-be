require "rails_helper"

describe("Truck OpenDates API") do
  before(:each) do
    @food_truck = create(:food_truck)
    create_list(:open_date, 5, food_truck: @food_truck)

    @food_truck_2 = create(:food_truck)
    @other_open_date = create(:open_date, food_truck: @food_truck_2)
  end

  describe("GET /food_trucks/:id/open_dates") do
    it("returns list of open_dates for specified truck") do

      get "/api/v1/food_trucks/#{@food_truck.id}/open_dates"

      all_open_dates = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(all_open_dates).to have_key(:data)
      expect(all_open_dates[:data]).to have_key(:id)
      expect(all_open_dates[:data][:id]).to eq(@food_truck.id.to_s)
      expect(all_open_dates).to have_key(:included)
      expect(all_open_dates[:included].count).to eq(5)
      expect(all_open_dates[:included][0]).to have_key(:id)
      expect(all_open_dates[:included][0]).to have_key(:attributes)
      expect(all_open_dates[:included][0][:attributes]).to have_key(:id)
      expect(all_open_dates[:included][0][:attributes]).to have_key(:date)
      expect(all_open_dates[:included][0][:attributes]).to have_key(:booked?)
    end

    it('returns 400 if truck does not exist') do
      get "/api/v1/food_trucks/500/open_dates"

      data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(data).to have_key(:message)
      expect(data[:message]).to eq("Sorry, that food truck does not exist, please try again.")
    end
  end

  describe("POST /api/v1/food_truck/:food_truck_id/open_dates") do
    it('should create new open_date') do
      new_open_date_attributes = attributes_for(:open_date)

      post "/api/v1/food_trucks/#{@food_truck.id}/open_dates", params: new_open_date_attributes

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(@food_truck.open_dates.count).to eq(6)
      expect(@food_truck.open_dates.last[:date]).to eq(new_open_date_attributes[:date])
    end

    it('should return 400 if params not valid') do
      post "/api/v1/food_trucks/#{@food_truck.id}/open_dates", params: {booked?: true}

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(error[:message]).to eq("Could not save, please try again.")
    end
  end

  describe("PUT /api/v1/food_trucks/:food_truck_id/open_dates/:id") do
    it("should edit the given open date") do
      open_date = @food_truck.open_dates.first

      original_date = open_date[:date]
      original_booked = open_date[:booked?]

      put "/api/v1/food_trucks/#{@food_truck.id}/open_dates/#{open_date.id}",
        params: { date: "Mon, 7 Jan 2019", booked?: !original_booked }

      updated_open_date = JSON.parse(response.body)

      expect(response.status).to eq(201)
      expect(response).to be_successful
      expect(open_date[:date]).to_not eq(original_date)
      expect(open_date[:date]).to eq("Mon, 7 Jan 2019")
      expect(open_date[:booked?]).to eq(!original_booked)
    end
  end
end
