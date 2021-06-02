class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :room_type, null: false
      t.monetize :price, null: false, default: 0
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
