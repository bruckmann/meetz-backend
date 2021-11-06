class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.references :meeting_room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :initial_date
      t.datetime :end_date
      t.string :note

      t.timestamps
    end
  end
end

##20211106031734