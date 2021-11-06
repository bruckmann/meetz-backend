class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.references :room_specification, null: false, foreign_key: true
      t.string :image_url

      t.timestamps
    end
  end
end

#20211106032220