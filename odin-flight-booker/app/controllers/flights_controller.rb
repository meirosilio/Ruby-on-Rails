class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map{|airport| [airport.iata_code, airport.id]}
    @dates = Flight.available_dates
    get_flights if params[:commit]

  end

  private

  def get_flights
    if params[:origin_airport_id]!= params[:destination_airport_id]
      @flights = Flight.available_flights( params[:origin_airport_id],
                                           params[:destination_airport_id],
                                           params[:departure_date])
      if !@flights.any?
        flash[:danger]= "Please choose a different dates."
      end
    else
      flash[:danger]= "Please choose a different destination."
    end
  end

end