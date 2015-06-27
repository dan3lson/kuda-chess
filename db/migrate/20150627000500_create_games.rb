class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id, null: false
      t.string :opponent_fname, null: false
      t.string :opponent_lname, null: false
      t.string :color, null: false
      t.string :result, null: false

      t.timestamps null: false
    end
  end
end
