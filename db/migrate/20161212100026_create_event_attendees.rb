class CreateEventAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :event_attendees do |t|
      t.timestamps null: false
    end
  end
end
