class AddColumnMovesToGames < ActiveRecord::Migration
  def change
    add_column :games, :counter, :integer, null: false
  end
end
