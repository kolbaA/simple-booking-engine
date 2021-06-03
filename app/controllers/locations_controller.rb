class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
  end

  private

  def location_params
    params.permit(:id)
  end
end
