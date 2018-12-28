class Api::V1::OpenDatesController < ApplicationController
  def index
    food_truck = FoodTruck.find(params[:food_truck_id])
    options = {}
    options[:include] = [:open_dates]
    render json: FoodTruckShowSerializer.new(food_truck, options).serialized_json
  end
end
