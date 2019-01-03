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

  def show
    food_truck = FoodTruck.find_by_id(params[:food_truck_id])
    open_date = food_truck.open_dates.find_by_id(params[:id]) unless food_truck.nil?
    if food_truck && open_date
      render json: OpenDateSerializer.new(open_date).serialized_json
    else
      render json: { message: "Could not locate resource."}, status: 404
    end
  end

  def create
    food_truck = FoodTruck.find_by(uid: params[:uid])
    open_date = food_truck.open_dates.create(open_date_params) unless food_truck.nil?
    if open_date && open_date.save
      render status: 201
    else
      render json: {message: "Could not save, please try again."}, status: 400
    end
  end

  def update
    food_truck = FoodTruck.find_by(uid: params[:uid])
    open_date = food_truck.open_dates.find_by_id(params[:id]) unless food_truck.nil?
    if food_truck && open_date && open_date.update(open_date_params)
      render json: OpenDateSerializer.new(open_date).serialized_json, status: 200
    else
      render json: {message: "Could not update, please try again."}, status: 400
    end
  end

  def destroy
    food_truck = FoodTruck.find_by_id(params[:food_truck_id])
    open_date = food_truck.open_dates.find_by_id(params[:id])
    if food_truck && open_date && open_date.destroy
      render status: 204
    else
      render json: { message: "Could not delete Open Date. Please try again." }, status: 400
    end
  end

  private

  def open_date_params
    params.permit(:date, :booked?)
  end
end
