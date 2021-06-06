# frozen_string_literal: true

module Rooms
  class ReservationService
    def initialize(room:, booking:)
      @room = room
      @booking = booking
    end

    def call
      raise 'Room is unavailable for booking' unless available_for_booking?

      room.transaction do
        room.inventories.available.where(date: [booking.starts_at...booking.ends_at]).lock.each do |inventory|
          inventory.lock!
          inventory.decrement!(:available_amount)
          inventory.save!
        end
        room.booking_items.create!(booking: booking)
      end
    end

    private

    attr_reader :room, :booking

    def available_for_booking?
      Rooms::AvailabilityCheckerService.new(
        room: room,
        from: booking.starts_at,
        to: booking.ends_at
      ).call
    end
  end
end
