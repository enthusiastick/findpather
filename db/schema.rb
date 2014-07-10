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

ActiveRecord::Schema.define(version: 20140710151718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "custom_spells", force: true do |t|
    t.string   "name",             null: false
    t.integer  "level",            null: false
    t.string   "school",           null: false
    t.string   "casting_time",     null: false
    t.string   "components",       null: false
    t.string   "range"
    t.string   "area"
    t.string   "target",           null: false
    t.string   "duration",         null: false
    t.string   "saving_throw"
    t.string   "spell_resistance"
    t.text     "description",      null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spells", force: true do |t|
    t.string   "name",       null: false
    t.string   "url",        null: false
    t.integer  "level",      null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "firstname",  null: false
    t.string   "lastname",   null: false
    t.string   "email",      null: false
    t.string   "google_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
