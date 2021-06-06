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
require 'rails_helper'

RSpec.describe Booking, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
