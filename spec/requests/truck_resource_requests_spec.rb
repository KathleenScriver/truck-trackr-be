require 'rails_helper'

describe "Food Truck API" do
  describe 'GET food trucks index end point' do
    it 'user can get all food trucks' do
        truck_1, truck_2, truck_3 = create_list(:food_truck, 3)

        get '/api/v1/food_trucks'

        expect(response).to be_successful

        trucks_response = JSON.parse(response.body)
        expect(trucks_response).to be_a(Hash)
        expect(trucks_response).to have_key('data')
        expect(trucks_response['data']).to be_a(Array)
        expect(trucks_response['data'].length).to eq(3)
        expect(trucks_response['data'][0]).to be_a(Hash)
        expect(trucks_response['data'][0]).to have_key('type')
        expect(trucks_response['data'][0]['type']).to eq('food_truck')
        expect(trucks_response['data'][0]).to have_key('id')
        expect(trucks_response['data'][0]['id']).to eq("#{truck_1.id}")
        expect(trucks_response['data'][0]).to have_key('attributes')
        expect(trucks_response['data'][0]['attributes']).to have_key('name')
        expect(trucks_response['data'][0]['attributes']['name']).to eq(truck_1.name)
    end
  end    
  describe 'GET food truck show end point' do
    it 'user can get food truck attributes' do
        truck = create(:food_truck)
        city = create(:city)
        create(:food_truck_city, food_truck: truck, city: city)

        get "/api/v1/food_trucks/#{truck.id}"

        expect(response).to be_successful

        trucks_response = JSON.parse(response.body)

        expect(trucks_response).to be_a(Hash)
        expect(trucks_response).to have_key('data')
        expect(trucks_response['data'].length).to eq(4)
        expect(trucks_response['data']).to be_a(Hash)
        expect(trucks_response['data']).to have_key('type')
        expect(trucks_response['data']['type']).to eq('food_truck')
        expect(trucks_response['data']).to have_key('id')
        expect(trucks_response['data']['id']).to eq("#{truck.id}")
        expect(trucks_response['data']).to have_key('attributes')
        expect(trucks_response['data']['attributes']).to have_key('name')
        expect(trucks_response['data']['attributes']['name']).to eq(truck.name)
        expect(trucks_response['data']['attributes']).to have_key('food_type')
        expect(trucks_response['data']['attributes']['food_type']).to eq(truck.food_type)
        expect(trucks_response['data']['attributes']).to have_key('contact_name')
        expect(trucks_response['data']['attributes']['contact_name']).to eq(truck.contact_name)
        expect(trucks_response['data']['attributes']).to have_key('phone_number')
        expect(trucks_response['data']['attributes']['phone_number']).to eq(truck.phone_number)
        expect(trucks_response['data']['attributes']).to have_key('website')
        expect(trucks_response['data']['attributes']['website']).to eq(truck.website)
        expect(trucks_response['data']['attributes']).to have_key('logo_image')
        expect(trucks_response['data']['attributes']['logo_image']).to eq(truck.logo_image)
        expect(trucks_response['data']).to have_key('relationships')
        expect(trucks_response['data']['relationships']).to be_a(Hash)
        expect(trucks_response['data']['relationships']).to have_key('cities')
        expect(trucks_response['data']['relationships']['cities']).to be_a(Hash)
        expect(trucks_response['data']['relationships']['cities']).to have_key('data')
        expect(trucks_response['data']['relationships']['cities']['data']).to be_a(Array)
        expect(trucks_response['data']['relationships']['cities']['data'].length).to eq(1)
        expect(trucks_response['data']['relationships']['cities']['data'][0]).to be_a(Hash)
        expect(trucks_response['data']['relationships']['cities']['data'][0]).to have_key('id')
        expect(trucks_response['data']['relationships']['cities']['data'][0]['id']).to eq(city.id.to_s)
        expect(trucks_response['data']['relationships']['cities']['data'][0]).to have_key('type')
        expect(trucks_response['data']['relationships']['cities']['data'][0]['type']).to eq('city')
    end
  end    
end
