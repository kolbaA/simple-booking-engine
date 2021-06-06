module Bookable
  extend ActiveSupport::Concern

  included do
    has_many :booking_items, as: :bookable
    has_many :bookings, through: :booking_items, source: :booking
    belongs_to :location
    monetize :price_cents

    validates :location_id, :price_cents, :price_currency, presence: true
  end
end
