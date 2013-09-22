class RenameRoleUsers < ActiveRecord::Migration
  def up
    rename_table('role_users', 'roles_users')
  end

  def down
    rename_table('roles_users', 'role_users')
  end
end
