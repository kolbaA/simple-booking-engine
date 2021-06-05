# frozen_string_literal: true

module Activities
  class ReservationService
    def initialize(activity:, starts_at:, ends_at:, user_id:)
      @activity = activity
      @starts_at = starts_at
      @ends_at = ends_at
      @user_id = user_id
    end

    def call
      activity.bookings.create!(
        starts_at: starts_at,
        ends_at: ends_at,
        user_id: user_id
      )
    end

    private

    attr_reader :activity, :starts_at, :ends_at, :user_id
  end
end
