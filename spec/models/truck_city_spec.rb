require 'rails_helper'

RSpec.describe TruckCity, type: :model do
  describe "validations" do
    it { should validate_presence_of(:city) }
  end
  describe "relationships" do
    it { should belong_to(:food_truck) }
  end
end
