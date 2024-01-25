class CreateEventAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendances do |t|
      t.integer :attedee, index: true
      t.integer :attended_event, index: true
      t.timestamps
    end
    drop_table :event_attendance
  end
end
