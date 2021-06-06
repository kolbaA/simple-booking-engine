class CreateBookingItems < ActiveRecord::Migration[6.1]
  def change
    create_table :booking_items do |t|
      t.belongs_to :booking, null: false, foreign_key: true
      t.belongs_to :bookable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
