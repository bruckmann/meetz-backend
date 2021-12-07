class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_view :rooms
  end
end
