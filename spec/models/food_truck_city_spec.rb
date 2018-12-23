require 'rails_helper'

RSpec.describe FoodTruckCity, type: :model do
  describe "relationships" do
    it { should belong_to(:food_truck) }
    it { should belong_to(:city) }
  end
end
