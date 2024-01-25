class AddAttendance < ActiveRecord::Migration[7.1]
  def change
    create_table :event_attendance do |t|
      t.integer :attedee, index: true
      t.integer :attended_event, index: true
    end
  end
end
