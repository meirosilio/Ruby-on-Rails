class Airport < ApplicationRecord
  has_many :arriving_flights, foreign_key: 'destination_airport_id',
           class_name: 'Flight'

  has_many :departing_flights, foreign_key: 'origin_airport_id',
           class_name: 'Flight'
end
