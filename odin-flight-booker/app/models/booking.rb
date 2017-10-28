class Booking < ApplicationRecord
  belongs_to :flight
  has_many :passengers
  accepts_nested_attributes_for :passengers

  validates :flight_id, presence: true
  validates_associated :passengers
end
