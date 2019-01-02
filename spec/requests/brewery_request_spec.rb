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
      expect(brewery_data[:data].count).to eq(4)
      expect(brewery_data[:data]).to have_key(:id)
      expect(brewery_data[:data][:id]).to eq(brewery.id.to_s)
      expect(brewery_data[:data]).to have_key(:type)
      expect(brewery_data[:data][:type]).to eq("brewery")
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
      expect(brewery_data[:data][:attributes]).to have_key(:website)
      expect(brewery_data[:data][:attributes][:website]).to eq(brewery.website)
      expect(brewery_data[:data][:attributes]).to have_key(:logo_image)
      expect(brewery_data[:data][:attributes][:logo_image]).to eq(brewery.logo_image)
    end
    it("returns a 404 if brewery does not exist") do

      get "/api/v1/breweries/100"

      brewery_data = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(404)
      expect(brewery_data).to have_key(:message)
      expect(brewery_data[:message]).to eq("Brewery not found with ID 100")
    end
  end
  describe("POST /breweries/:id") do
    it("creates a brewery with all required attributes") do
      payload = {
        name: "Delirium",
        address: "1156 Windsor St., Boulder, CO 80604",
        contact_name: "Elliot",
        phone: "555-555-5555",
        email: "ddefault@mockweb.com",
        website: "http://dddefaultmockwebsite.com",
        uid: "123abc"
      }

      post "/api/v1/breweries", params: payload

      brewery_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(brewery_data).to have_key(:data)
      expect(brewery_data[:data].count).to eq(4)
      expect(brewery_data[:data]).to have_key(:id)
      expect(brewery_data[:data][:id]).to_not eq(nil)
      expect(brewery_data[:data]).to have_key(:type)
      expect(brewery_data[:data][:type]).to eq("brewery")
      expect(brewery_data[:data]).to have_key(:attributes)
      expect(brewery_data[:data][:attributes]).to have_key(:name)
      expect(brewery_data[:data][:attributes]).to_not have_key(:uid)
      expect(brewery_data[:data][:attributes][:name]).to eq(payload[:name])
      expect(brewery_data[:data][:attributes]).to have_key(:address)
      expect(brewery_data[:data][:attributes][:address]).to eq(payload[:address])
      expect(brewery_data[:data][:attributes]).to have_key(:contact_name)
      expect(brewery_data[:data][:attributes][:contact_name]).to eq(payload[:contact_name])
      expect(brewery_data[:data][:attributes]).to have_key(:phone)
      expect(brewery_data[:data][:attributes][:phone]).to eq(payload[:phone])
      expect(brewery_data[:data][:attributes]).to have_key(:email)
      expect(brewery_data[:data][:attributes][:email]).to eq(payload[:email])
      expect(brewery_data[:data][:attributes]).to have_key(:website)
      expect(brewery_data[:data][:attributes][:website]).to eq(payload[:website])
    end
    it("returns a 400 if brewery doesn't have all the required paramters") do
      payload = {
        address: "1156 Windsor St., Boulder, CO 80604",
        contact_name: "Elliot",
        phone: "555-555-5555",
        email: "ddefault@mockweb.com",
        website: "http://dddefaultmockwebsite.com"
      }

      post "/api/v1/breweries", params: payload

      brewery_data = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(400)
      expect(brewery_data).to have_key(:message)
      expect(brewery_data[:message]).to eq("Failed")
    end
  end
  describe("PUT /breweries/:id") do
    it("updates a brewery with all required attributes") do
      brewery = create(:brewery)

      payload = {
        address: "1156 Windsor St., Boulder, CO 80604",
        contact_name: "Elliot",
        phone: "555-555-5555",
        email: "updated@mockweb.com"
      }

      put "/api/v1/breweries/#{brewery.id}", params: payload

      brewery_data = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(brewery_data).to have_key(:data)
      expect(brewery_data[:data].count).to eq(4)
      expect(brewery_data[:data]).to have_key(:id)
      expect(brewery_data[:data][:id]).to_not eq(brewery.id)
      expect(brewery_data[:data]).to have_key(:type)
      expect(brewery_data[:data][:type]).to eq("brewery")
      expect(brewery_data[:data]).to have_key(:attributes)
      expect(brewery_data[:data][:attributes]).to have_key(:name)
      expect(brewery_data[:data][:attributes][:name]).to eq(brewery.name)
      expect(brewery_data[:data][:attributes]).to have_key(:address)
      expect(brewery_data[:data][:attributes][:address]).to eq(payload[:address])
      expect(brewery_data[:data][:attributes]).to have_key(:contact_name)
      expect(brewery_data[:data][:attributes][:contact_name]).to eq(payload[:contact_name])
      expect(brewery_data[:data][:attributes]).to have_key(:phone)
      expect(brewery_data[:data][:attributes][:phone]).to eq(payload[:phone])
      expect(brewery_data[:data][:attributes]).to have_key(:email)
      expect(brewery_data[:data][:attributes][:email]).to eq(payload[:email])
      expect(brewery_data[:data][:attributes]).to have_key(:website)
      expect(brewery_data[:data][:attributes][:website]).to eq(brewery.website)
    end
    it("returns a 404 if brewery is not found") do
      brewery = create(:brewery)

      payload = {
        address: "1156 Windsor St., Boulder, CO 80604",
        contact_name: "Elliot",
        phone: "555-555-5555",
        email: "updated@mockweb.com"
      }

      put "/api/v1/breweries/100", params: payload

      brewery_data = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(404)
      expect(brewery_data).to have_key(:message)
      expect(brewery_data[:message]).to eq("Brewery not found with ID 100")
    end
  end
  describe("DELETE /breweries/:id") do
    it("deletes a selected brewery") do
      brewery = create(:brewery)
      brewery_event_attrs = attributes_for(:brewery_event)
      brewery.brewery_events.create(brewery_event_attrs)

      delete "/api/v1/breweries/#{brewery.id}"

      expect(response).to be_successful
      expect(response.status).to eq(204)

      get "/api/v1/breweries/#{brewery.id}"

      brewery_data = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(404)
      expect(brewery_data).to have_key(:message)
      expect(brewery_data[:message]).to eq("Brewery not found with ID #{brewery.id}")
    end
    it("returns a 404 if brewery is not found") do
      brewery = create(:brewery)

      delete "/api/v1/breweries/100"

      brewery_data = JSON.parse(response.body, symbolize_names: true)
      expect(response.status).to eq(404)
      expect(brewery_data).to have_key(:message)
      expect(brewery_data[:message]).to eq("Brewery not found with ID 100")
    end
  end
end
