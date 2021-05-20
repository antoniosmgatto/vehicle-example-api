# frozen_string_literal: true

FactoryBot.define do
  factory :vehicle do
    license_plate { Faker::Vehicle.license_plate }
    make { Faker::Vehicle.make }
    model { Faker::Vehicle.model }
    color { Faker::Vehicle.color }
    category { Faker::Vehicle.car_type }
    vin { Faker::Vehicle.vin }
  end
end
