module Api
  module Bookings
    class Index < Grape::API
      format :json

      resource :bookings do
        desc 'Create a booking for specific location and room.'
        params do
          requires :location_id, type: Integer, desc: 'Location Id.'
          requires :starts_at, type: String, desc: 'Booking Starts at date.'
          requires :ends_at, type: String, desc: 'Booking ends at date.'
          requires :room_id, type: Integer, desc: 'Room id to reserve.'
          requires :user_id, type: String, desc: 'User session key or id.'
          optional :activities_ids, type: String, desc: 'Activities ids to reserve separated by comma.'
        end
        post do
          booking = ::Bookings::CreateReservationService.new(
            params,
            user_id: params[:user_id]
          ).call

          {
            rooms: booking.rooms,
            activities: booking.activities
          }
        end
      end
    end
  end
end
