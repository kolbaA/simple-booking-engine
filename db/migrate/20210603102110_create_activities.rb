class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.monetize :price, default: 0, null: false
      t.belongs_to :location, foreign_key: true, null: false

      t.timestamps
    end
  end
end
