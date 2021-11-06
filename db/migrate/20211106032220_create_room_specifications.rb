class CreateRoomSpecifications < ActiveRecord::Migration[6.1]
  def change
    create_table :room_specifications do |t|
      t.string :name
      t.string :description
      t.integer :max_person
      t.boolean :has_data_show
      t.boolean :has_board
      t.boolean :has_split
      t.string :size

      t.timestamps
    end
  end
end

##20211106031419