module Api
  module Locations
    class Rooms < Grape::API
      format :json

      resource :rooms do
        desc 'Returns a List of available rooms for specific location'
        params do
          requires :starts_at, types: [Date, DateTime], desc: 'available from'
          requires :ends_at, types: [Date, DateTime], desc: 'available to'
        end
        route_param :location_id do
          get do
            location = Location.find(params[:location_id])
            Locations::RoomsWithAvailabilityQuery.new(
              location: @location,
              from: Date.parse(params[:starts_at]),
              to: Date.parse(params[:ends_at])
            ).call
          end
        end
      end
    end
  end
end
