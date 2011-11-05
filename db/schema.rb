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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111105135235) do

  create_table "actions", :force => true do |t|
    t.text    "name"
    t.text    "offensive_skills_used"
    t.text    "associated_player_ids"
    t.text    "defensive_skills_used"
    t.integer "game_id"
    t.integer "turn"
    t.integer "order"
    t.integer "team_id"
  end

  create_table "dice", :force => true do |t|
    t.integer "result"
    t.integer "roll_type"
    t.integer "action_id"
  end

  create_table "dungeons", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", :force => true do |t|
    t.integer  "home_rerolls"
    t.integer  "away_rerolls"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "home_fans"
    t.integer  "away_fans"
    t.integer  "home_apothecaries"
    t.integer  "away_apothecaries"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", :force => true do |t|
    t.integer  "st"
    t.integer  "ag"
    t.integer  "mv"
    t.integer  "av"
    t.integer  "spp"
    t.text     "skills"
    t.text     "injuries"
    t.string   "name"
    t.string   "position"
    t.integer  "team_id"
    t.integer  "fumbbl_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "x"
    t.integer  "y"
    t.text     "status"
    t.text     "injury_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.integer  "game_id"
    t.integer  "fumbbl_id"
    t.string   "name"
    t.integer  "rerolls"
    t.integer  "fan_factor"
    t.integer  "assistant_coaches"
    t.integer  "cheerleaders"
    t.boolean  "apothecary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "fumbbl_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
