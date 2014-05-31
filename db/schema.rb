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

ActiveRecord::Schema.define(version: 20140531032306) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mover_addresses", force: true do |t|
    t.integer  "mover_id",   null: false
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mover_addresses", ["mover_id"], name: "index_mover_addresses_on_mover_id", unique: true, using: :btree

  create_table "mover_compliances", force: true do |t|
    t.integer  "mover_id",                    null: false
    t.string   "general_liability_insurance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "automobile_insurance"
    t.string   "cargo_insurance"
    t.string   "workers_compensation"
  end

  add_index "mover_compliances", ["mover_id"], name: "index_mover_compliances_on_mover_id", unique: true, using: :btree

  create_table "mover_heroes", force: true do |t|
    t.integer  "mover_id",   null: false
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mover_heroes", ["mover_id"], name: "index_mover_heroes_on_mover_id", unique: true, using: :btree

  create_table "mover_licenses", force: true do |t|
    t.integer  "mover_id",             null: false
    t.string   "company_registration"
    t.string   "puc"
    t.string   "state_dot"
    t.string   "us_dot"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mover_licenses", ["mover_id"], name: "index_mover_licenses_on_mover_id", unique: true, using: :btree

  create_table "mover_opening_hours", force: true do |t|
    t.integer  "mover_id",    null: false
    t.integer  "day_of_week"
    t.time     "open"
    t.time     "close"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mover_opening_hours", ["mover_id", "day_of_week"], name: "index_mover_opening_hours_on_mover_id_and_day_of_week", unique: true, using: :btree

  create_table "mover_pricings", force: true do |t|
    t.integer  "mover_id",           null: false
    t.integer  "avg_price_per_hour"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mover_services", force: true do |t|
    t.integer  "mover_id",                               null: false
    t.boolean  "appliances_install",     default: false
    t.boolean  "appliances_uninstall",   default: false
    t.boolean  "auto_transport",         default: false
    t.boolean  "bulky_items",            default: false
    t.boolean  "cleaning",               default: false
    t.boolean  "crating",                default: false
    t.boolean  "electronics_packaging",  default: false
    t.boolean  "extra_stops",            default: false
    t.boolean  "furniture_assembly",     default: false
    t.boolean  "furniture_disassembly",  default: false
    t.boolean  "furniture_wrapping",     default: false
    t.boolean  "gun_safe",               default: false
    t.boolean  "packaging",              default: false
    t.boolean  "personal_truck_loading", default: false
    t.boolean  "pianos",                 default: false
    t.boolean  "shuttling",              default: false
    t.boolean  "storage",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mover_services", ["mover_id"], name: "index_mover_services_on_mover_id", unique: true, using: :btree

  create_table "mover_statistics", force: true do |t|
    t.integer  "mover_id",     null: false
    t.integer  "employees"
    t.integer  "year_started"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trucks"
  end

  add_index "mover_statistics", ["mover_id"], name: "index_mover_statistics_on_mover_id", unique: true, using: :btree

  create_table "mover_yelp_ids", force: true do |t|
    t.integer  "mover_id",   null: false
    t.string   "yelp_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "mover_yelp_ids", ["mover_id", "yelp_id"], name: "index_mover_yelp_ids_on_mover_id_and_yelp_id", unique: true, using: :btree

  create_table "movers", force: true do |t|
    t.string   "name",        null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
