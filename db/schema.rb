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

ActiveRecord::Schema.define(version: 2018_12_29_173419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "contact_name"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_image"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_truck_cities", force: :cascade do |t|
    t.bigint "food_truck_id"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_food_truck_cities_on_city_id"
    t.index ["food_truck_id"], name: "index_food_truck_cities_on_food_truck_id"
  end

  create_table "food_trucks", force: :cascade do |t|
    t.string "name"
    t.string "food_type"
    t.string "contact_name"
    t.string "phone"
    t.string "email"
    t.string "logo_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "website"
  end

  create_table "open_dates", force: :cascade do |t|
    t.date "date"
    t.boolean "booked?", default: false
    t.bigint "food_truck_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_truck_id"], name: "index_open_dates_on_food_truck_id"
  end

  add_foreign_key "food_truck_cities", "cities"
  add_foreign_key "food_truck_cities", "food_trucks"
  add_foreign_key "open_dates", "food_trucks"
end
