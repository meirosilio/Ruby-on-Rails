class Flight < ApplicationRecord

  belongs_to :origin_airport, class_name: 'Airport'
  belongs_to :destination_airport, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  def self.available_dates
    flights = Flight.all.order(departure_date: :asc)
    flights.map {|flight| flight.departure_date.strftime('%d/%m/%Y')}.uniq
  end


  def self.available_flights(origin, destination, dept_date)
    where(origin_airport_id: origin, destination_airport_id: destination,
          departure_date: Flight.parse_date(dept_date))
  end

  #def self.available_flights(origin, destination, dept_date)
   # temp = Flight.parse_date(dept_date)
    #where("origin_airport_id = ? AND destination_airport_id = ? AND departure_date = ?", origin, destination, temp)
  #end


  # Parse a string date into a range object representing the whole day
  def self.parse_date(date)
    datetime = date.to_datetime
    datetime.beginning_of_day..datetime.end_of_day
  end
end
