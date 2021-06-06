# frozen_string_literal: true

module Locations
  class RoomsWithAvailabilityQuery
    def initialize(location:, from:, to:)
      @location = location
      @from = from.to_date
      @to = to.to_date
    end

    def call
      location.rooms.joins(:inventories)
              .where(inventories: { date: [from...to] })
              .where('inventories.available_amount > 0')
              .group('rooms.id')
              .select('rooms.*', "count(rooms.id) = #{days_amount_in_daterange} AS available")
    end

    private

    attr_reader :from, :to, :location

    def days_amount_in_daterange
      (to - from).to_i
    end
  end
end
