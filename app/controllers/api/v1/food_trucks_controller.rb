class Api::V1::FoodTrucksController < ApplicationController
  def index
    food_trucks = FoodTruck.all
    render json: FoodTruckIndexSerializer.new(food_trucks).serialized_json
  end

  def show
    food_truck = FoodTruck.find_by_id(params[:id])
    if food_truck
      render json: FoodTruckShowSerializer.new(food_truck).serialized_json
    else
      render json: {message: "Food Truck not found with ID #{params[:id]}"}, status: 404
    end
  end
end
