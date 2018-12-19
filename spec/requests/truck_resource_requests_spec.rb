require 'rails_helper'

describe 'GET food trucks index end point' do
    it 'user can get all food trucks' do
        truck_1, truck_2, truck_3 = create_list(:truck, 3)

        get 'api/v1/food-trucks'

        expect(response).to be_successful

        trucks_response = JSON.parse(response.body)

        expect(trucks_response).to be_a(Hash)
        expect(trucks_response).to have_key('data')
        expect(trucks_response['data']).to be_a(Array)
        expect(trucks_response['data'].length).to eq(3)
        expect(trucks_response['data'][0]).to be_a(Hash)
        expect(trucks_response['data'][0]).to have_key('type')
        expect(trucks_response['data'][0]['type']).to eq('food_trucks')
        expect(trucks_response['data'][0]).to have_key('id')
        expect(trucks_response['data'][0]['id']).to eq(truck_1.id)
        expect(trucks_response['data'][0]).to have_key('attributes')
        expect(trucks_response['data'][0]['atrributes']).to have_key('name')
        expect(trucks_response['data'][0]['attributes']['name']).to eq(truck_1.name)
        expect(trucks_response['data'][0]['atrributes']).to have_key('food_type')
        expect(trucks_response['data'][0]['attributes']['food_type']).to eq(truck_1.food_type)
        expect(trucks_response['data'][0]['atrributes']).to have_key('contact_name')
        expect(trucks_response['data'][0]['attributes']['contact_name']).to eq(truck_1.contact_name)
        expect(trucks_response['data'][0]['atrributes']).to have_key('phone_number')
        expect(trucks_response['data'][0]['attributes']['phone_number']).to eq(truck_1.phone_number)
        expect(trucks_response['data'][0]['atrributes']).to have_key('logo_image')
        expect(trucks_response['data'][0]['attributes']['logo_image']).to eq(truck_1.logo_image)
        expect(trucks_response['data'][0]).to have_key('relationships')
        expect(trucks_response['data'][0]['relationships']).to be_a(Hash)
        expect(trucks_response['data'][0]['relationships']).to have_key('cities_served')
        expect(trucks_response['data'][0]['relationships']['cities_served']).to be_a(Hash)
        expect(trucks_response['data'][0]['relationships']['cities_served']).to have_key('data')
        expect(trucks_response['data'][0]['relationships']['cities_served']['data']).to be_a(Array)
        expect(trucks_response['data'][0]['relationships']['cities_served']['data'].length).to eq(5)
        expect(trucks_response['data'][0]['relationships']['cities_served']['data'].sort).to eq(truck_1.cities.sort)
        expect(trucks_response['data'][0]['relationships']['cities_served']['data'][0]).to be_a(Hash)
        expect(trucks_response['data'][0]['relationships']['cities_served']['data'][0]).to have_key("id")
        expect(trucks_response['data'][0]['relationships']['cities_served']['data'][0]).to have_key("type")
        expect(trucks_response['data'][0]['relationships']['cities_served']['data'][0]).to eq("truck_cities")
        expect(trucks_response['data'][0]['relationships']['cities_served']['data'][0]).to have_key("city")
    end
end