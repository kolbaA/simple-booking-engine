# frozen_string_literal: true

module Activities
  class ReservationService
    def initialize(activity:, booking:)
      @activity = activity
      @booking = booking
    end

    def call
      activity.booking_items.create!(booking: booking)
    end

    private

    attr_reader :activity, :booking
  end
end
