class CreateMeetingRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :meeting_rooms do |t|
      t.references :room_localization, null: false, foreign_key: true
      t.references :room_specification, null: false, foreign_key: true

      t.timestamps
    end
  end
end


##20211106031640
##20211106031734