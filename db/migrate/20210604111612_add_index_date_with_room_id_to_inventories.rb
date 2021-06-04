class AddIndexDateWithRoomIdToInventories < ActiveRecord::Migration[6.1]
  def change
    add_index :inventories, [:date, :room_id], unique: true
  end
end
