class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = Brewery.all
    render json: BreweryIndexSerializer.new(breweries).serialized_json
  end
end
