class CreateSprites < ActiveRecord::Migration
  def change
    create_table :sprites do |t|
      t.float :velocity_x
      t.float :velocity_y
      t.float :turn_velocity
      t.string :name

      t.timestamps
    end
  end
end
