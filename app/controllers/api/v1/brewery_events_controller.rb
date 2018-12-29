class Api::V1::BreweryEventsController < ApplicationController
  def index
    brewery = Brewery.find_by_id(params[:brewery_id])
    if brewery
      options = {}
      options[:include] = [:brewery_events]
      render json: BreweryShowSerializer.new(brewery, options).serialized_json
    else
      render json: {message: "Sorry, that brewery does not exist, please try again."}, status: 400
    end
  end

  def create
    brewery = Brewery.find_by_id(params[:brewery_id])
    brewery_event = brewery.brewery_events.create(brewery_event_params)
    if brewery_event.save
      render status: 201
    else
      render json: {message: "Could not save, please try again."}, status: 400
    end
  end

  private

  def brewery_event_params
    params.permit(:date, :truck_booked?)
  end
end