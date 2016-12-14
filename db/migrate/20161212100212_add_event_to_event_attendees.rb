class AddEventToEventAttendees < ActiveRecord::Migration[5.0]
  def change
  	add_reference :event_attendees, :event, index: true, foreign_key: true
  end
end
