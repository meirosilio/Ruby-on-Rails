class EventAttendeesController < ApplicationController


  def create
    @event = Event.find(params[:event_attendee][:attended_event_id])
    current_user.attend!(@event)
    flash[:notice] = "#{current_user.full_name} you attend to #{@event.title} successfully."
    redirect_to @event

  end

  def destroy
    @event =  EventAttendee.find(params[:id]).attended_event
    current_user.cancel!(@event)
    flash[:notice] = "#{current_user.full_name} you cancel your praticipation at the #{@event.title} event."
    redirect_to @event
  end




end
