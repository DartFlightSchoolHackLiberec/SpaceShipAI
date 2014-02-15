class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :api_key
      t.integer :step_count

      t.timestamps
    end
  end
end
