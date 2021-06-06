class AddLocationIdToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :location_id, :bigint, null: false, foreign_key: true
  end
end
