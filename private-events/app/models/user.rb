class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events, foreign_key: :creator_id

  has_many :event_attendees,  :foreign_key => :attendee_id
  has_many :attended_events,  :through => :event_attendees


  def attending?(event)
    event.attendees.include?(self)
  end

  def attend!(event)
    self.event_attendees.create!(attended_event_id:event.id)
  end

  def cancel!(event)
    self.event_attendees.find_by(attended_event_id:event.id).destroy
  end

  def number_of_attended_events
    self.event_attendees.count
  end

  def number_of_hosted_events
    self.events.count
  end

end
