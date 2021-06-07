# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    association :location
    name { FFaker::FreedomIpsum.word }
    price_cents { rand(10..20) }
  end
end
