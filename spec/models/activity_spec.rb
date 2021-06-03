# == Schema Information
#
# Table name: activities
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  location_id    :bigint           not null
#
# Indexes
#
#  index_activities_on_location_id  (location_id)
#
# Foreign Keys
#
#  fk_rails_...  (location_id => locations.id)
#
require 'rails_helper'

RSpec.describe Activity, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
