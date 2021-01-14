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

ActiveRecord::Schema.define(version: 2021_01_13_185715) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coins", force: :cascade do |t|
    t.string "description"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "mining_type_id"
    t.index ["mining_type_id"], name: "index_coins_on_mining_type_id"
  end

  create_table "devices", force: :cascade do |t|
    t.string "description"
    t.string "localization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "unit_id"
    t.boolean "connection"
    t.bigint "type_id"
    t.index ["type_id"], name: "index_devices_on_type_id"
    t.index ["unit_id"], name: "index_devices_on_unit_id"
  end

  create_table "load_topics", force: :cascade do |t|
    t.string "description"
    t.string "pin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loads", force: :cascade do |t|
    t.string "description"
    t.boolean "state"
    t.datetime "schedule"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "load_topic_id"
    t.bigint "device_id"
    t.index ["device_id"], name: "index_loads_on_device_id"
    t.index ["load_topic_id"], name: "index_loads_on_load_topic_id"
  end

  create_table "measures", force: :cascade do |t|
    t.string "date"
    t.float "voltage"
    t.float "current"
    t.float "power"
    t.float "energy"
    t.float "frequency"
    t.float "pf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "device_id"
    t.index ["device_id"], name: "index_measures_on_device_id"
  end

  create_table "mining_types", force: :cascade do |t|
    t.string "description"
    t.string "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "function"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "description"
    t.string "localization"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units_users", force: :cascade do |t|
    t.bigint "unit_id"
    t.bigint "user_id"
    t.index ["unit_id"], name: "index_units_users_on_unit_id"
    t.index ["user_id"], name: "index_units_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "devices", "types"
  add_foreign_key "devices", "units"
  add_foreign_key "loads", "devices"
  add_foreign_key "measures", "devices"
end
