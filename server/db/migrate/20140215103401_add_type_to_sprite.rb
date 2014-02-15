class AddTypeToSprite < ActiveRecord::Migration
  def change
    add_column :sprites, :type, :string
  end
end
