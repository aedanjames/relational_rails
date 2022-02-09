class HotelSuitesController < ApplicationController
  def index
    @hotel = Hotel.find(params[:id])
  
    if params[:sort]
      @suites = @hotel.alphabetical
    else
      @suites = @hotel.suites
    end
  end

  def new
    @hotel = Hotel.find(params[:id])
  end

  def create
    hotel = Hotel.find(params[:id])
    suite = hotel.suites.create!(suite_params)
    redirect_to "/hotels/#{hotel.id}/suites"
end

private
  def suite_params
    params.permit(:name, :clean, :number_of_beds)
  end
end
