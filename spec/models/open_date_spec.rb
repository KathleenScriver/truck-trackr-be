require 'rails_helper'

RSpec.describe OpenDate, type: :model do
  describe('validations') do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:booked?) }
  end
  describe('relationships') do
    it { should belong_to(:food_truck) }
  end
end
