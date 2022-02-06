class HotelSuitesController < ApplicationController
  def index
    @hotel = Hotel.find(params[:id])
    @suites = @hotel.suites
  end
end
