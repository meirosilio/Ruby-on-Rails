class Flight < ApplicationRecord

  belongs_to :origin_airport, class_name: "Airport"
  belongs_to :destination_airport, class_name: "Airport"

  def self.available_dates
    flights = all.order(departure_date: :asc)
    flights.map {|flight| flight.departure_date.strftime('%d/%m/%y')}.uniq
  end

end
