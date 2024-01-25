class FixEventAttendances < ActiveRecord::Migration[7.1]
  def change
    rename_column :event_attendances, :attedee, :attendee
  end
end
