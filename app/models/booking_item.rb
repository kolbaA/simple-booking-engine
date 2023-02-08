# == Schema Information
#
# Table name: booking_items
#
#  id            :bigint           not null, primary key
#  bookable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  bookable_id   :bigint           not null
#  booking_id    :bigint           not null
#
# Indexes
#
#  index_booking_items_on_bookable    (bookable_type,bookable_id)
#  index_booking_items_on_booking_id  (booking_id)
#
# Foreign Keys
#
#  fk_rails_...  (booking_id => bookings.id)
#
class BookingItem < ApplicationRecord
  belongs_to :booking
  belongs_to :bookable, polymorphic: true

  validates :booking_id, :bookable_id, :bookable_type, presence: true

  def test_method
    puts 5
  end
end
