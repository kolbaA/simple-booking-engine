# frozen_string_literal: true

module Rooms
  class ReservationService
    def initialize(room:, starts_at:, ends_at:, user_id:)
      @room = room
      @starts_at = starts_at
      @ends_at = ends_at
      @user_id = user_id
    end

    def call
      raise 'Room is unavailable for booking' unless available_for_booking?

      room.transaction do
        room.inventories.available.where(date: [starts_at...ends_at]).lock.each do |inventory|
          inventory.lock!
          inventory.available_amount =- 1
          inventory.save!
        end
        room.bookings.create!(
          starts_at: starts_at,
          ends_at: ends_at,
          user_id: user_id
        )
      end
    end

    private

    attr_reader :room, :ends_at, :starts_at, :user_id

    def available_for_booking?
      Rooms::AvailabilityCheckerService.new(
        room: room,
        from: starts_at,
        to: ends_at
      ).call
    end
  end
end
