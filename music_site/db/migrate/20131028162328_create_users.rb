class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :type
      t.string :handle
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
