# == Schema Information
#
# Table name: rooms
#
#  id             :bigint           not null, primary key
#  max_available  :integer          default(10), not null
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  room_type      :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  location_id    :bigint           not null
#
# Indexes
#
#  index_rooms_on_location_id  (location_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#
class Room < ApplicationRecord
  include Bookable

  has_many :inventories, dependent: :destroy

  enum room_type: %i[dorm privat deluxe]

  def display_room_type
    return 'Private' if privat?

    room_type.humanize
  end
end
