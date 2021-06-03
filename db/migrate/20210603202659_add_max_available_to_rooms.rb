class AddMaxAvailableToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :max_available, :integer, null: false, default: 10
  end
end
