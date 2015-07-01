class CitiesController < ApplicationController
  def index
  	@cities = City.all.search(params[:q])
  end

  def show
  	@city = City.find(params[:id])
  end
end
