class Api::V1::OpenDatesController < ApplicationController
  def index
    food_truck = FoodTruck.find_by_id(params[:food_truck_id])
    if food_truck
      options = {}
      options[:include] = [:open_dates]
      render json: FoodTruckShowSerializer.new(food_truck, options).serialized_json
    else
      render json: {message: "Sorry, that food truck does not exist, please try again."}, status: 400
    end
  end

  def create
    food_truck = FoodTruck.find_by_id(params[:food_truck_id])
    open_date = food_truck.open_dates.create(open_date_params)
    if open_date.save
      render status: 201
    else
      render json: {message: "Could not save, please try again."}, status: 400
    end
  end

  def update
<<<<<<< HEAD
    food_truck = FoodTruck.find_by_id(params[:food_truck_id])
    open_date = food_truck.open_dates.find_by_id(params[:id])
    if food_truck && open_date && open_date.update(open_date_params)
      render json: OpenDateSerializer.new(open_date).serialized_json, status: 201
=======
    open_date = OpenDate.find_by_id(params[:id])
    if open_date && open_date.update(open_date_params)
      render json: {test: "test"}, status: 201
>>>>>>> 4e3908335c1f487204e6985cc69de1af52e01eb5
    else
      render json: {message: "Could not update, please try again."}, status: 400
    end
  end

  private

  def open_date_params
    params.permit(:date, :booked?)
  end
end
