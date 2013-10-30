class RenameHandleToUsernameInUser < ActiveRecord::Migration

  def change
    rename_column :users, :handle, :username
    # pass: table name, current column name, new column name
  end

end
