# frozen_string_literal: true

module Bookings
  class CreationService
    def initialize(creation_params, user_id:)
      @starts_at = creation_params[:starts_at]
      @ends_at = creation_params[:ends_at]
      @room_id = creation_params[:room_id]
      @activities_ids = creation_params[:activities_ids]
      @user_id = user_id
    end

    def call
      raise 'Room is not available for booking' unless room_available_for_booking?

      ActiveRecord::Base.transaction do
        Rooms::ReservationService.new(
          room: room,
          starts_at: starts_at,
          ends_at: ends_at,
          user_id: user_id
        ).call
        room.reserve!(user_id)
        activities_ids.each { |activity| activity.reserve!(user_id) }
      end
  # check that room available
    # if false -> return and show errors
    # if true
    #  create booking
    #  decrement all inventories.available_amount for selected dates
    #  create booking for activities      
    end

    private

    attr_reader :starts_at, :ends_at, :room_id, :activities_ids, :user_id

    def room_available_for_booking?
      Rooms::AvailabilityCheckerService.new(
        room: room,
        from: starts_at,
        to: ends_at
      ).call
    end

    def room
      @room ||= Room.find(room_id)
    end

    def activities
      @activities ||= Activity.where(id: activities_ids)
    end
  end
end
