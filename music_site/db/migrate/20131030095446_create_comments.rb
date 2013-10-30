class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.belongs_to :music
      t.belongs_to :user
      t.text :content
      t.timestamps
    end
    add_index :comments, :music_id
    add_index :comments, :user_id
  end

  def down
    drop_table :comments
  end
end
