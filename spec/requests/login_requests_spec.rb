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
end
