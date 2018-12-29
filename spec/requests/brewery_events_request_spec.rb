require "rails_helper"

describe("Brewery Events API") do
  describe("GET /breweries/:id/events") do
    it("returns list of events for specified brewery") do
      brewery = create(:brewery)
      create_list(:brewery_event, 5, brewery: brewery)

      brewery_2 = create(:brewery)
      other_event = create(:brewery_event, brewery: brewery_2)

      get "/api/v1/breweries/#{brewery.id}/brewery_events"
      
      all_events = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(all_events).to have_key(:data)
      expect(all_events[:data]).to have_key(:id)
      expect(all_events[:data][:id]).to eq(brewery.id.to_s)
      expect(all_events).to have_key(:included)
      expect(all_events[:included].count).to eq(5)
      expect(all_events[:included][0]).to have_key(:id)
      expect(all_events[:included][0]).to have_key(:attributes)
      expect(all_events[:included][0][:attributes]).to have_key(:id)
      expect(all_events[:included][0][:attributes]).to have_key(:date)
      expect(all_events[:included][0][:attributes]).to have_key(:truck_booked?)
    end
    it('returns 400 if brewery does not exist') do
      get "/api/v1/breweries/500/brewery_events"

      data = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(data).to have_key(:message)
      expect(data[:message]).to eq("Sorry, that brewery does not exist, please try again.")
    end
  end
  describe("POST /api/v1/breweries/:brewery_id/brewery_events") do
    it('should create new brewery event') do
      brewery = create(:brewery)
      new_brewery_event_attributes = attributes_for(:brewery_event)

      post "/api/v1/breweries/#{brewery.id}/brewery_events", params: new_brewery_event_attributes

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(brewery.brewery_events.count).to eq(1)
      expect(brewery.brewery_events.last[:date]).to eq(new_brewery_event_attributes[:date])
    end
    it('should return 400 if params not valid') do
      brewery = create(:brewery)
      post "/api/v1/breweries/#{brewery.id}/brewery_events", params: {truck_booked?: true}

      error = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(400)
      expect(error[:message]).to eq("Could not save, please try again.")
    end
  end
end