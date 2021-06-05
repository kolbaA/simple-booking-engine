class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(location_params[:id])
    binding.pry
  end

  def available_rooms
    @location = Location.find(location_params[:id])
    @rooms = Locations::RoomsWithAvailabilityQuery.new(
      location: @location,
      from: Date.parse(location_params[:starts_at]),
      to: Date.parse(location_params[:ends_at])
    ).call
  end

  private

  def location_params
    params.permit(:id, :starts_at, :ends_at)
  end
end
