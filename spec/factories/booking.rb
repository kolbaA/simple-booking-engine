# frozen_string_literal: true

FactoryBot.define do
  factory :booking do
    association :location
    user_id { SecureRandom.hex(10) }
    starts_at { Time.zone.now + 1.day }
    ends_at { Time.zone.now + 4.days }

    after(:create) do |booking, evaluator|
      create(:booking_item, booking: booking, bookable: create(:room, location: booking.location))
    end

    trait :activities do
      transient do
        amount { 1 }
      end

      after(:create) do |booking, evaluator|
        evaluator.amount.times do
          create(:booking_item, booking: booking, bookable: create(:activity, location: booking.location))
        end
      end
    end
  end
end
