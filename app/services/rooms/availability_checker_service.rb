# frozen_string_literal: true

module Rooms
  class AvailabilityCheckerService
    def initialize(room:, from:, to:)
      @room = room
      @from = from
      @to = to
    end

    def call
      avaiable_room_ids = room.inventories.available.where(date: [from...to]).lock.pluck(:id)
      avaiable_room_ids.count == days_amount_in_daterange
    end

    private

    attr_reader :room, :from, :to

    def days_amount_in_daterange
      (to - from).to_i + 1
    end
  end
end
