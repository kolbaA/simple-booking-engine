module Bookable
  extend ActiveSupport::Concern

  included do
    has_many :bookings, as: :bookable
    belongs_to :location
    monetize :price_cents
  end
end
