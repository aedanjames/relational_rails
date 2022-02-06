class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
  end

  def create
    hotel = Hotel.create(name: params[:name], five_stars: params[:five_stars], year_founded: params[:year_founded] )
    redirect_to "/hotels"
  end
end
