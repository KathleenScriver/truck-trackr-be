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
      render json: {message: "Brewery not found with ID #{params[:id]}"}, status: 404
    end
  end

  def create
    brewery = Brewery.new(brewery_params)
    if brewery.save
      render json: BreweryShowSerializer.new(brewery).serialized_json, status: 201
    else
      render json: {message: "Failed"}, status: 400
    end
  end

  def update
    brewery = Brewery.find_by_id(params[:id])
    if brewery
      brewery.update(brewery_params)
      render json: BreweryShowSerializer.new(brewery).serialized_json, 201
    else
      render json: {message: "Brewery not found with ID #{params[:id]}"}, status: 404
    end
  end

  def destroy
    brewery = Brewery.find_by_id(params[:id])
    if brewery
      brewery.destroy
      render status: 204
    else
      render json: {message: "Brewery not found with ID #{params[:id]}"}, status: 404
    end
  end

  private
    def brewery_params
      params.permit(:name, :address, :contact_name, :phone, :email, :website, :logo_image)
    end
end
