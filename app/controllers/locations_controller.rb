class LocationsController < ApplicationController
  before_action :find_location, only: %i[show available_rooms]

  def index
    @locations = Location.all
  end

  def show; end

  private

  def location_params
    params.permit(:id, :starts_at, :ends_at)
  end

  def find_location
    @location = Location.find(location_params[:id] || location_params[:location_id])
  end
end
