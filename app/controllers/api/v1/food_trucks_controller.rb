class Api::V1::FoodTrucksController < ApplicationController
  def index
    food_trucks = FoodTruck.all
    render json: FoodTruckIndexSerializer.new(food_trucks).serialized_json
  end

  def show
    food_truck = FoodTruck.find_by_id(params[:id])
    render json: FoodTruckShowSerializer.new(food_truck).serialized_json
  end
end
