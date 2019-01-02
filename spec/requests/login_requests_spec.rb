require "rails_helper"

describe("Login Logout API") do
  describe("POST /login") do
    it("should create a session for user") do
      food_truck = create(:food_truck)

      payload = {
        "account_type": "food_truck",
        "uid": food_truck.uid
      }

      post "/login", params: payload

      expect(response).to be_successful
      expect(response.status).to eq(201)
    end
  end

  describe("DELETE /logout") do
    it("should log out the current user") do
      food_truck = create(:food_truck)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(food_truck)

      delete "/logout"

      logout_response = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(logout_response[:message]).to eq("You have successfully logged out.")
    end
  end
end
