# == Schema Information
#
# Table name: inventories
#
#  id               :bigint           not null, primary key
#  available_amount :integer          not null
#  date             :date             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  room_id          :bigint           not null
#
# Indexes
#
#  index_inventories_on_date_and_room_id  (date,room_id) UNIQUE
#  index_inventories_on_room_id           (room_id)
#
# Foreign Keys
#
#  fk_rails_...  (room_id => rooms.id)
#
class Inventory < ApplicationRecord
  belongs_to :room

  scope :available, -> { where('available_amount > ?', 0) }

  validates :date, :available_amount, :room_id, presence: true
  validates :available_amount, numericality: { greater_than_or_equal_to: 0 }
end
