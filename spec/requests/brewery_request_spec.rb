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
  describe("GET /breweries/:id") do
    it("returns a brewery with all its attributes") do
      brewery = create(:brewery)

      get "/api/v1/breweries/#{brewery.id}"

      brewery_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(brewery_data).to have_key(:data)
      expect(brewery_data[:data].count).to eq(3)
      expect(brewery_data[:data]).to have_key(:id)
      expect(brewery_data[:data][:id]).to eq(brewery.id.to_s)
      expect(brewery_data[:data]).to have_key(:type)
      expect(brewery_data[:data][:type]).to eq("brewery_show")
      expect(brewery_data[:data]).to have_key(:attributes)
      expect(brewery_data[:data][:attributes]).to have_key(:name)
      expect(brewery_data[:data][:attributes][:name]).to eq(brewery.name)
      expect(brewery_data[:data][:attributes]).to have_key(:address)
      expect(brewery_data[:data][:attributes][:address]).to eq(brewery.address)
      expect(brewery_data[:data][:attributes]).to have_key(:contact_name)
      expect(brewery_data[:data][:attributes][:contact_name]).to eq(brewery.contact_name)
      expect(brewery_data[:data][:attributes]).to have_key(:phone)
      expect(brewery_data[:data][:attributes][:phone]).to eq(brewery.phone)
      expect(brewery_data[:data][:attributes]).to have_key(:email)
      expect(brewery_data[:data][:attributes][:email]).to eq(brewery.email)
    end
  end
end
