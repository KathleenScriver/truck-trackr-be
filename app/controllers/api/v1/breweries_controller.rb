class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = Brewery.all
    render json: BreweryIndexSerializer.new(breweries).serialized_json
  end

  def show
    brewery = Brewery.find(params[:id])
    render json: BreweryShowSerializer.new(brewery).serialized_json
  end
end
