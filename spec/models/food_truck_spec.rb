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
  describe "class methods" do
    describe ".all_emails" do 
      it "should return all emails of all food trucks" do
        truck_1, truck_2, truck_3 = create_list(:food_truck, 3)

        expect(FoodTruck.all_emails).to be_a(Array) 
        expect(FoodTruck.all_emails.count).to eq(3)
        expect(FoodTruck.all_emails).to eq([truck_1.email, truck_2.email, truck_3.email])
      end
    end
  end
end
