require 'rails_helper'

RSpec.describe BreweryEvent, type: :model do
  describe('validations') do
    it { should validate_presence_of(:date) }
  end
  describe('relationships') do
    it { should belong_to(:brewery) }
  end
end
