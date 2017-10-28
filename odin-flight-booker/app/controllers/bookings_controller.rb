class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flight = Flight.find_by(id: params[:flight_id])
    @number_of_passangers = params[:passengers].to_i
    @number_of_passangers.times{@booking.passengers.build }
  end

  def create
    @booking=Booking.new(booking_params)
    @flight= Flight.find_by(id:params[:booking][:flight_id])

    if @booking.save
      redirect_to booking_path(@booking)
      flash[:success] = "We saved your resversation details."
    else
      render :new
    end
  end

  def show
    @booking=Booking.find_by(id:params[:id])
    @passangers_counter= @booking.passengers.count
    @flight_details=Flight.find(@booking.flight_id)
  end

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes:[:id, :name, :email])
  end
end