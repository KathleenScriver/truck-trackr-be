require "rails_helper"

describe("Brewery API") do
  describe("GET /breweries") do
    it("returns a list of all breweries") do
      breweries = create_list(:brewery, 8)

      get '/api/v1/breweries'

      brewery_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(brewery_data).to have_key(:data)
      expect(brewery_data[:data].count).to eq(8)
      expect(brewery_data[:data][0]).to have_key(:id)
      expect(brewery_data[:data][0]).to have_key(:attributes)
      expect(brewery_data[:data][0][:attributes]).to have_key(:name)
    end
  end
end
