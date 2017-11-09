class PassengerMailer < ApplicationMailer

  default from: 'bookings@oneway.com'
  def thanks_email(passenger,flight)
    @passenger = passenger
    @flight = flight
    @url = 'localhost:3000/'
    mail(to: @passenger.email, subject: 'You have booked your flight!')
  end
end
