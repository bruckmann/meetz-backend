class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :userId
      t.string :name
      t.string :password
      t.string :email
      t.references :role, :roleId  
    end
  end
end
