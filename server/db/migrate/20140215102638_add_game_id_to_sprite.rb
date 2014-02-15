class AddGameIdToSprite < ActiveRecord::Migration
  def change
    add_reference :sprites, :game, index: true
  end
end
