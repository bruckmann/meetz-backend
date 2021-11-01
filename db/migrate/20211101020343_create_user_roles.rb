class CreateUserRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :user_roles do |t|
      t.string :role
    end
  end
end
