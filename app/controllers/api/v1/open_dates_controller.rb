class Api::V1::OpenDatesController < ApplicationController
  def index
    food_truck = FoodTruck.find(params[:food_truck_id])
    render json: FoodTruckOpenDatesSerializer.new(food_truck).serialized_json
  end
end
