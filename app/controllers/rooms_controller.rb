# frozen_string_literal: true

class RoomsController < LocationsController
  before_action :find_location, only: :index

  def index
    @rooms = Locations::RoomsWithAvailabilityQuery.new(
      location: @location,
      from: Date.parse(location_params[:starts_at]),
      to: Date.parse(location_params[:ends_at])
    ).call
  end

  private

  def location_params
    params.permit(:location_id, :starts_at, :ends_at)
  end
end
