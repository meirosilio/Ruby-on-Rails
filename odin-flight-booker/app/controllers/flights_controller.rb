class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all.map{|airport| [airport.iata_code, airport.id]}
    @dates = Flight.available_dates
  end
end
