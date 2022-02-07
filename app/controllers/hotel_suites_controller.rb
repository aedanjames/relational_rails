class HotelSuitesController < ApplicationController
  def index
    @hotel = Hotel.find(params[:id])
    @suites = @hotel.suites
  end

  def create
    hotel = Hotel.find(params[:id])
    suite = hotel.suites.create!(suite_params)
    redirect_to "/hotels/#{hotel.id}/suites"
end
end
