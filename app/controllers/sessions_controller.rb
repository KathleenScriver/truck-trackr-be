class SessionsController < ApplicationController
  def create
    if params[:account_type] == "food_truck"
      food_truck = FoodTruck.find_by(uid: params[:uid])
      session[:food_truck_id] = food_truck.id
      render status: 201
    elsif params[:account_type] == "brewery"
      brewery = Brewery.find_by(uid: params[:uid])
      session[:brewery_id] = brewery.id
      render status: 201
    else
      render status: 404
    end
  end

  def destroy
    session.delete(:food_truck_id) || session.delete(:brewery_id)
    render json: { message: "You have successfully logged out." }, status: 200
  end
end
