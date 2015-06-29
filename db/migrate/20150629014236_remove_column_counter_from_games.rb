class RemoveColumnCounterFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :counter, :integer
  end
end
