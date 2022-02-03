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

ActiveRecord::Schema.define(version: 2022_02_02_223733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "five_stars"
    t.integer "year_founded"
  end

  create_table "organizations", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name"
    t.integer "year_founded"
    t.string "president"
    t.boolean "international"
  end

  create_table "suites", force: :cascade do |t|
    t.string "name"
    t.boolean "clean"
    t.integer "number_of_beds"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "hotel_id"
    t.index ["hotel_id"], name: "index_suites_on_hotel_id"
  end

  add_foreign_key "suites", "hotels"
end
