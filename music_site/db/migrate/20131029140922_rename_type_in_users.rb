class RenameTypeInUsers < ActiveRecord::Migration

  def change
    rename_column :users, :type, :user_type
    # pass: table name, current column name, new column name
  end

  # REMINDER: Why the change?
  # The single-table inheritance mechanism failed to locate the subclass: 'musician'.
  # This error is raised because the column 'type' is reserved for storing the class in case of inheritance.
  # Please rename this column if you didn't intend it to be used for storing the inheritance class
  # or overwrite User.inheritance_column to use another column for that information.

end
