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
      ActiveRecord::Base.transaction do
        booking = reserve_room!
        reserve_activities!
      end
    end

    private

    attr_reader :starts_at, :ends_at, :room_id, :activities_ids, :user_id

    def reserve_room!
      Rooms::ReservationService.new(
        room: room,
        starts_at: starts_at,
        ends_at: ends_at,
        user_id: user_id
      ).call
    end

    def reserve_activities!
      activities_ids.each do |activity_id|
        Activities::ReservationService.new(
          activity: Activity.find(activity_id)
          starts_at: starts_at,
          ends_at: ends_at
        )
      end
    end

    def room
      @room ||= Room.find(room_id)
    end

    def activities
      @activities ||= Activity.where(id: activities_ids)
    end
  end
end
