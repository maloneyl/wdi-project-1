class AddPositionToMusic < ActiveRecord::Migration
  def change
    add_column :music, :position, :integer
  end
end
