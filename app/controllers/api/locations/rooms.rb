module Api
  module Locations
    class Rooms < Grape::API
      format :json

      route_param :location_id do
        resource :rooms do
          desc 'Returns a List of available rooms for specific location'
          params do
            requires :starts_at, type: String, desc: 'available from'
            requires :ends_at, types: String, desc: 'available to'
          end
          get do
            ::Locations::AvailableRoomsQuery.new(
              location: Location.find(params[:location_id]),
              from: Date.parse(params[:starts_at]),
              to: Date.parse(params[:ends_at])
            ).call
          end
        end
      end
    end
  end
end
