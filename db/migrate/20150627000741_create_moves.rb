class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.integer :counter, null: false
      t.string :white, null: false
      t.string :black, null: false
      t.integer :game_id, null: false

      t.timestamps null: false
    end
  end
end
