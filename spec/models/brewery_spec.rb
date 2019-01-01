require "rails_helper"

describe Brewery do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:contact_name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:uid) }
    it { should validate_uniqueness_of(:uid) }
  end
end
