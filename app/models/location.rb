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
class Location < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :activities, dependent: :destroy
end
