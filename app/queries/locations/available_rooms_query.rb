# frozen_string_literal: true

module Locations
  class AvailableRoomsQuery
    def initialize(location:, from:, to:)
      def initialize(location:, from:, to:)
        @location = location
        @from = from.to_date
        @to = to.to_date
      end

      def call
        location.rooms.joins(:inventories).
          where(inventories: { date: [from..to] }).
          where('inventories.available_amount > 0').
          group('rooms.id').
          having('count(rooms.id) = ?', days_amount_in_daterange)
      end

      private

      attr_reader :from, :to, :location

      def days_amount_in_daterange
        (to - from).to_i + 1
      end
    end
  end
end
