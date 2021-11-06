class CreateRoomLocalizations < ActiveRecord::Migration[6.1]
  def change
    create_table :room_localizations do |t|
      t.string :floor
      t.string :number

      t.timestamps
    end
  end
end

##20211106031609