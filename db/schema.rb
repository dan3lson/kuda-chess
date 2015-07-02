# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150702025126) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "opponent_fname", null: false
    t.string   "opponent_lname", null: false
    t.string   "color",          null: false
    t.string   "result",         null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.date     "day",            null: false
  end

  add_index "games", ["day"], name: "index_games_on_day", using: :btree
  add_index "games", ["opponent_fname"], name: "index_games_on_opponent_fname", using: :btree
  add_index "games", ["opponent_lname"], name: "index_games_on_opponent_lname", using: :btree
  add_index "games", ["user_id"], name: "index_games_on_user_id", using: :btree

  create_table "moves", force: :cascade do |t|
    t.string   "white",      null: false
    t.string   "black",      null: false
    t.integer  "game_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "moves", ["game_id"], name: "index_moves_on_game_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username",        null: false
    t.integer  "rating"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
