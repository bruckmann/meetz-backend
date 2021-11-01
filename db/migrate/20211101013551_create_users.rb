class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.references :user_role, foreign_key: true, null: false
      t.timestamps
    end
  end
end
