class Event < ApplicationRecord
	belongs_to :creator, :class_name => "User"

	has_many :attendees, :through => :event_attendees, foreign_key: :event_id
	has_many :event_attendees

	scope :events_upcoming, -> {where("date < ?", Date.today)}

	scope :previous_events, -> {where("date > ?", Date.today)}

	def self.undetermined
		self.where("date = ?", 1)
	end
end