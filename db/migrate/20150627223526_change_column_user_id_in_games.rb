class ChangeColumnUserIdInGames < ActiveRecord::Migration
  def up
    change_column :games, :user_id, :integer, null: true
  end

  def down
    change_column :games, :user_id, :integer, null: false
  end
end
