class AddIndicesUserIdOppononentNameToGames < ActiveRecord::Migration
  def change
    add_index :games, :user_id
    add_index :games, :opponent_fname
    add_index :games, :opponent_lname
  end
end
