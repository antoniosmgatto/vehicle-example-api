class Vehicle < ApplicationRecord

    validates :license_plate, presence: true
    validates :make, presence: true
    validates :model, presence: true
    validates :color, presence: true
    validates :category, presence: true
    validates :vin, presence: true

end
