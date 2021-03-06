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

ActiveRecord::Schema.define(version: 20140303111250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deletings", force: true do |t|
    t.string   "delete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_positions", force: true do |t|
    t.integer  "device_id"
    t.float    "lat"
    t.float    "lng"
    t.integer  "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "device_positions", ["device_id"], name: "index_device_positions_on_device_id", using: :btree

  create_table "devices", force: true do |t|
    t.text     "model"
    t.text     "uiid"
    t.text     "os"
    t.boolean  "connected"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lives", force: true do |t|
    t.date     "dob"
    t.string   "of"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "years", force: true do |t|
    t.integer  "year"
    t.text     "summary"
    t.integer  "life_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "years", ["life_id"], name: "index_years_on_life_id", using: :btree

end
