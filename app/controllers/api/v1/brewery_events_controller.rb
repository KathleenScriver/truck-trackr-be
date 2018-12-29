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
end