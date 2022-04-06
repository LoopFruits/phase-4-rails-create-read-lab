class PlantsController < ApplicationController
  #Get /plants
  def index
    #returns an array of all plants 
    plants = Plant.all
    render json: plants 
  end

  #Get /plants/:id
  def show
    #returns the first and second plant 
    plant = Plant.find_by(id: params[:id])
    render json: plant
  end

  #post /plants
  def create
    #creates new plant 
    plant = Plant.create(params[:plant])
    #returns the plant data 
    render json: plant, status: :created 
    #returns a status code of 201 
  end

  private 

  def plant_params 
    params.require(:plant).permit(:name, :image, :price)
  end
end
