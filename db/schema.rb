# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_04_111612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_activities_on_location_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "user_id", null: false
    t.string "bookable_type", null: false
    t.bigint "bookable_id", null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bookable_type", "bookable_id"], name: "index_bookings_on_bookable"
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.date "date", null: false
    t.integer "available_amount", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["date", "room_id"], name: "index_inventories_on_date_and_room_id", unique: true
    t.index ["room_id"], name: "index_inventories_on_room_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "country", null: false
    t.string "city", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country"], name: "index_locations_on_country"
  end

  create_table "rooms", force: :cascade do |t|
    t.integer "room_type", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "USD", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "max_available", default: 10, null: false
    t.index ["location_id"], name: "index_rooms_on_location_id"
  end

  add_foreign_key "activities", "locations"
  add_foreign_key "inventories", "rooms"
  add_foreign_key "rooms", "locations"
end
