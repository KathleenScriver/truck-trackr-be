class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = Brewery.all
    render json: BreweryIndexSerializer.new(breweries).serialized_json
  end

  def show
    brewery = Brewery.find_by_id(params[:id])
    if brewery
      render json: BreweryShowSerializer.new(brewery).serialized_json
    else
      render json: {message: "Brewery not found with that ID"}, status: 404
    end
  end
end
