# == Schema Information
#
# Table name: rooms
#
#  id             :bigint           not null, primary key
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
  enum room_type: %i[dorm private deluxe]

  belongs_to :location
end
