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
    it 'should upload an image when provided' do
      brewery = create(:brewery, logo_image: File.new(File.join(Rails.root, 'public/test.jpeg')))
      
      expect(brewery.logo_image).to be_a(LogoUploader)
      expect(brewery.logo_image_identifier).to eq('test.jpeg')
    end
  end
end

