class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(location_params[:id])
  end

  def available_bookings
  end

  private

  def location_params
    params.permit(:id)
  end
end
