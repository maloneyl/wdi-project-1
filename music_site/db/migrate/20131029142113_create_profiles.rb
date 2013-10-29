class CreateProfiles < ActiveRecord::Migration
  def up
    create_table :profiles do |t|
      t.string :font_face_primary
      t.string :font_face_secondary
      t.string :font_color_primary
      t.string :font_color_secondary     
      t.string :link_color
      t.text :background_image
      t.text :avatar
      t.text :bio
      t.string :location
      t.string :twitter
      t.string :facebook
      t.string :website
      t.belongs_to :user
      t.timestamps
    end
  end

  def down
    drop_table :profiles
  end
end
