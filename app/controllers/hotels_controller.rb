class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
  end

#this methopd also works when the info inside the () is not too long. So there are not too many attributes.
  # def create
  #   hotel = Hotel.create(name: params[:name], five_stars: params[:five_stars], year_founded: params[:year_founded] )
  #   redirect_to "/hotels"
  # end

  def create
    hotel = Hotel.create(hotel_params)
    redirect_to "/hotels"
  end

#Rails has a syntax called strong params: for pulling data from the params hash.
  def hotel_params
    params.permit(:name, :five_stars, :year_founded)
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    hotel = Hotel.find(params[:id])
    hotel.update(hotel_params)
    redirect_to '/hotels'
  end

  def hotel_params
    params.permit(:name, :five_stars, :year_founded)
  end
end
