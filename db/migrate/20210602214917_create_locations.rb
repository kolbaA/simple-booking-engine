class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :country, null: false
      t.string :city, null: false

      t.timestamps
      t.index :country
    end
  end
end
