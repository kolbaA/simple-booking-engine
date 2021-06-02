# == Schema Information
#
# Table name: locations
#
#  id         :bigint           not null, primary key
#  city       :string           not null
#  country    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_locations_on_country  (country)
#
require 'rails_helper'

RSpec.describe Location, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
