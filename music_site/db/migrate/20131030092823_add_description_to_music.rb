class AddDescriptionToMusic < ActiveRecord::Migration
  def change
    add_column :music, :description, :text
  end
end
