class CreateRoleUsers < ActiveRecord::Migration
  def change
    create_table :role_users do |t|
      t.references  :roles
      t.references :users
      t.timestamps
    end

  end
end
