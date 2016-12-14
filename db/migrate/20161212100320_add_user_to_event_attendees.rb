class AddUserToEventAttendees < ActiveRecord::Migration[5.0]
  def change
  	    add_reference :event_attendees, :user, index: true, foreign_key: true
  end
end
