class RenameRolesUsersColumns < ActiveRecord::Migration
  def up
    rename_column('roles_users','roles_id','role_id')
    rename_column('roles_users','users_id','user_id')
  end

  def down
    rename_column('roles_users','role_id','roles_id')
    rename_column('roles_users','user_id','users_id')
  end
end
