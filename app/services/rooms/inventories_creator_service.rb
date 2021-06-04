# frozen_string_literal: true

module Rooms
  class InventoriesCreatorService
    def initialize(room, until_date)
      @room = room
      @until_date = until_date.to_date
    end

    def call
      inventory_date = starts_date

      ActiveRecord::Base.transaction do
        until inventory_date == until_date
          room.inventories.create!(
            available_amount: room.max_available,
            date: inventory_date
          )
          inventory_date += 1.day
        end
      end
    end

    private

    attr_reader :room, :until_date

    def starts_date
      return Time.zone.now.to_date if room.inventories.blank?

      room.inventories.order(:date).last.date + 1.day
    end
  end
end
