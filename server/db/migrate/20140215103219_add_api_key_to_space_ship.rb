class AddApiKeyToSpaceShip < ActiveRecord::Migration
  def change
    add_column :sprites, :api_key, :string
  end
end
