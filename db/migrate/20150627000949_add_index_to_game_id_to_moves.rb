class AddIndexToGameIdToMoves < ActiveRecord::Migration
  def change
    add_index :moves, :game_id
  end
end
