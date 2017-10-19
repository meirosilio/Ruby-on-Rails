class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :event_attendees,  :foreign_key => :attended_event_id
  has_many :attendees, 		:through => :event_attendees

  scope :upcoming, -> { where("date > ?", Date.today).order("date ASC") }
  scope :past, -> { where("date < ?", Date.today).order("date DESC") }

  def number_of_attendants
    self.attendees.count
  end

end
