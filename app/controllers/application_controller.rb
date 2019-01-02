class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  protect_from_forgery unless: -> {request.format.json?}
  before_action :set_csrf_cookie

  def current_user
    @current_user ||= find_user
  end

  def authorize
    render status: 404 if current_user.nil?
  end

  private

  def find_user
    FoodTruck.find_by(id: session[:food_truck_id]) if session[:food_truck_id]
    Brewery.find_by(id: session[:brewery_id]) if session[:brewery_id]
  end

  def set_csrf_cookie
    cookies["CSRF-TOKEN"] = form_authenticity_token
  end
end
