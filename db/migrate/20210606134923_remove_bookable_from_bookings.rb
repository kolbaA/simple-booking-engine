class RemoveBookableFromBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :bookable_id
    remove_column :bookings, :bookable_type
  end
end
