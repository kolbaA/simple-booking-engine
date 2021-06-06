# == Schema Information
#
# Table name: bookings
#
#  id          :bigint           not null, primary key
#  ends_at     :datetime         not null
#  starts_at   :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :bigint           not null
#  user_id     :string           not null
#
class Booking < ApplicationRecord
  belongs_to :location

  has_many :booking_items, dependent: :destroy
  has_many :rooms, through: :booking_items, source: :bookable, source_type: 'Room'
  has_many :activities, through: :booking_items, source: :bookable, source_type: 'Activity'
end
