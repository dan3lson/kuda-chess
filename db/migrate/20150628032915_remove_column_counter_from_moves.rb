class RemoveColumnCounterFromMoves < ActiveRecord::Migration
  def change
    remove_column :moves, :counter, :integer
  end
end
