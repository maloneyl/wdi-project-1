class CreateMusic < ActiveRecord::Migration
  def up
    create_table :music do |t|
      t.string :title
      t.text :track
      t.string :genre
      t.text :art
      t.belongs_to :user
      t.timestamps
    end
  end

  def down
    drop_table :music
  end
end
