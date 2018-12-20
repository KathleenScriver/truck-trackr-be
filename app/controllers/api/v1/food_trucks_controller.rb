class Api::V1::FoodTrucksController < ApplicationController

    def index
        food_trucks = FoodTruck.all
        render json: FoodTruckSerializer.new(food_trucks).serialized_json
    end

end
