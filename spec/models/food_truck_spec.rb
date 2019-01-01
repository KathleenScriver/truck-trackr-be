require 'rails_helper'

RSpec.describe FoodTruck, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:food_type) }
    it { should validate_presence_of(:contact_name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:uid) }
    it { should validate_uniqueness_of(:uid) }
  end
  describe "relationships" do
    it { should have_many(:food_truck_cities) }
    it { should have_many(:cities).through(:food_truck_cities) }
    it { should have_many(:open_dates) }
  end
end
