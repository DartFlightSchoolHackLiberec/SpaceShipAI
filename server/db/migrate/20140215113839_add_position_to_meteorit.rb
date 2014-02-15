class AddPositionToMeteorit < ActiveRecord::Migration
  def change
    add_column :sprites, :position_x, :float
    add_column :sprites, :position_y, :float
    add_column :sprites, :rotation, :float
  end
end
