class RenameUserTypeToRoleInUsers < ActiveRecord::Migration

  def change
    rename_column :users, :user_type, :role
    # pass: table name, current column name, new column name
  end

  # REMINDER: Why the change?
  # Less confusion when using cancan...

end
