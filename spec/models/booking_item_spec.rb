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
require 'rails_helper'

RSpec.describe BookingItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
