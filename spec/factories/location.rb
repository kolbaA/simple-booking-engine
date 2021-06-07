# frozen_string_literal: true

FactoryBot.define do
  factory :location do
    country { FFaker::Address.country }
    city { FFaker::Address.city }
  end
end
