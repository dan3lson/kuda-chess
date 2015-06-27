class AddColumnDayToGames < ActiveRecord::Migration
  def change
    add_column :games, :day, :date, null: false
  end
end
