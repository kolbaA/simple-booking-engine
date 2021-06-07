# frozen_string_literal: true

FactoryBot.define do
  factory :room do
    association :location
    room_type { Room::ROOM_TYPES.sample }
    price_cents { rand(10..20) }
    max_available { 10 }
  end
end
