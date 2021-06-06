# == Schema Information
#
# Table name: bookings
#
#  id            :bigint           not null, primary key
#  bookable_type :string           not null
#  ends_at       :datetime         not null
#  starts_at     :datetime         not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  bookable_id   :bigint           not null
#  user_id       :string           not null
#
# Indexes
#
#  index_bookings_on_bookable  (bookable_type,bookable_id)
#
class Booking < ApplicationRecord
  belongs_to :bookable, polymorphic: true
  has_one :location, through: :bookable
end
