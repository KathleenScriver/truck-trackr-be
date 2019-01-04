class Api::V1::FoodTrucksController < ApplicationController
  def index
    food_trucks = FoodTruck.all
    render json: FoodTruckIndexSerializer.new(food_trucks).serialized_json
  end

  def show
    food_truck = FoodTruck.find_by_id(params[:id])
    options = {}
    if food_truck
      options[:include] = [:cities, :open_dates]
      render json: FoodTruckShowSerializer.new(food_truck, options).serialized_json
    else
      render json: {message: "Food Truck not found with ID #{params[:id]}"}, status: 404
    end
  end

  def create
    food_truck = FoodTruck.create(food_truck_params)
    if food_truck.save
      render json: FoodTruckShowSerializer.new(food_truck).serialized_json, status: 201
    else
      render json: {message: "Failed"}, status: 400
    end
  end

  def update
    truck = FoodTruck.find_by(uid: params[:uid])
    if truck
      truck.update(food_truck_params)
      render json: FoodTruckShowSerializer.new(truck).serialized_json, status: 200
    else
      render json: {message: "Food Truck not found."}, status: 404
    end
  end

  def destroy
    truck = FoodTruck.find_by(uid: params[:uid])
    if truck
      truck.destroy
      render status: 204
    else
      render json: {message: "Food Truck not found with ID #{params[:id]}"}, status: 404
    end
  end

  private
    def food_truck_params
      params.permit(:name, :food_type, :contact_name, :phone, :email, :logo_image, :website, :uid)
    end
end
