class Api::V1::BreweriesController < ApplicationController
  def index
    breweries = Brewery.all
    render json: BrewerySerializer.new(breweries).serialized_json
  end
end
