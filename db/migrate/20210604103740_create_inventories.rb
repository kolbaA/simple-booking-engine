class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.belongs_to :room, null: false, foreign_key: true
      t.date :date, null: false
      t.integer :available_amount, null: false

      t.timestamps
    end
  end
end
