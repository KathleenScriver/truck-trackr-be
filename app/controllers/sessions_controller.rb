class SessionsController < ApplicationController
  def create
    food_truck = FoodTruck.find_by(uid: params[:uid])
    brewery = Brewery.find_by(uid: params[:uid])
    if (params[:account_type] == "food_truck") && food_truck
      render json: FoodTruckShowSerializer.new(food_truck).serialized_json, status: 201
    elsif (params[:account_type] == "brewery") && brewery
      render json: BreweryShowSerializer.new(brewery).serialized_json, status: 201
    else
      render status: 404
    end
  end
end
