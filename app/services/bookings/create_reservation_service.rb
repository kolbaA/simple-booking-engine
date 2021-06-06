# frozen_string_literal: true

module Bookings
  class CreateReservationService
    def initialize(creation_params, user_id:)
      @starts_at = creation_params[:starts_at]
      @ends_at = creation_params[:ends_at]
      @room_id = creation_params[:room_id]
      @activities_ids = creation_params[:activities_ids].split(',')
      @location_id = creation_params[:location_id]
      @user_id = user_id
    end

    def call
      ActiveRecord::Base.transaction do
        create_booking!
        reserve_room!
        reserve_activities!
      end

      booking
    end

    private

    attr_reader :starts_at, :ends_at, :room_id, :activities_ids, :user_id, :location_id, :booking

    def create_booking!
      @booking = location.bookings.create!(
        user_id: user_id,
        starts_at: starts_at,
        ends_at: ends_at
      )
    end

    def reserve_room!
      Rooms::ReservationService.new(
        room: room,
        booking: booking,
      ).call
    end

    def reserve_activities!
      activities.each do |activity|
        Activities::ReservationService.new(
          activity: activity,
          booking: booking
        ).call
      end
    end

    def room
      @room ||= Room.find(room_id)
    end

    def activities
      @activities ||= Activity.where(id: activities_ids)
    end

    def location
      @location ||= Location.find(location_id)
    end
  end
end
