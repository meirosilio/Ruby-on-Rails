class EventsController < ApplicationController

  before_action :authenticate_user!

  def index
    @events=Event.all
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def new
    @event = current_user.events.new
  end

  def create
    @event = current_user.events.create(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def show
    @event = Event.find_by(id:params[:id])
    @user_name =User.find_by(id:@event.creator_id).full_name
  end



  private

  def event_params
    params.require(:event).permit(:title,:location,:date, :description)
  end
end
