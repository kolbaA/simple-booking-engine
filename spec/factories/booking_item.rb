# frozen_string_literal: true

FactoryBot.define do
  factory :booking_item do
    association :booking
  end

  trait :room do
    association :bookable, factory: :room
  end

  trait :activity do
    association :bookable, factory: :activity
  end
end
