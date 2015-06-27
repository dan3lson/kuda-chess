class AddIndexToDaysInGames < ActiveRecord::Migration
  def change
    add_index :games, :day
  end
end
