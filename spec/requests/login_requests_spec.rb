require "rails_helper"

describe("Login Logout API") do
  describe("POST /login") do
    it("should create a session for food_truck") do
      food_truck = create(:food_truck)

      payload = {
        "account_type": "food_truck",
        "uid": food_truck.uid
      }

      post "/login", params: payload

      logged_in = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(logged_in).to have_key(:data)
      expect(logged_in[:data]).to have_key(:id)
      expect(logged_in[:data][:id]).to eq(food_truck.id.to_s)
      expect(logged_in[:data]).to have_key(:attributes)
      expect(logged_in[:data][:attributes]).to have_key(:name)
      expect(logged_in[:data][:attributes][:name]).to eq(food_truck.name)
    end

    it("should create a session for brewery") do
      brewery = create(:brewery)

      payload = {
        "account_type": "brewery",
        "uid": brewery.uid
      }

      post "/login", params: payload

      logged_in = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(logged_in).to have_key(:data)
      expect(logged_in[:data]).to have_key(:id)
      expect(logged_in[:data][:id]).to eq(brewery.id.to_s)
      expect(logged_in[:data]).to have_key(:attributes)
      expect(logged_in[:data][:attributes]).to have_key(:name)
      expect(logged_in[:data][:attributes][:name]).to eq(brewery.name)
    end
  end

  describe("DELETE /logout") do
    it("should log out the current logged in food truck") do
      food_truck = create(:food_truck)

      payload = {
        "account_type": "food_truck",
        "uid": food_truck.uid
      }

      post "/login", params: payload

      delete "/logout"

      logout_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(logout_response[:message]).to eq("You have successfully logged out.")
    end

    it("should log out the current logged in brewery") do
      brewery = create(:brewery)

      payload = {
        "account_type": "brewery",
        "uid": brewery.uid
      }

      post "/login", params: payload

      delete "/logout"

      logout_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(logout_response[:message]).to eq("You have successfully logged out.")
    end
  end
end
