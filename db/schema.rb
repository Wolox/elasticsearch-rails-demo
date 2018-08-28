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

ActiveRecord::Schema.define(version: 20180828162244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drama_clubs", force: :cascade do |t|
    t.string "title"
    t.string "city"
    t.string "category"
    t.string "time_range"
  end

  create_table "karate_dojos", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "activity_code"
    t.string "category"
  end

  create_table "photography_workshops", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "max_students"
    t.integer "available_cameras"
  end

  create_table "soccer_clubs", force: :cascade do |t|
    t.string "title"
    t.string "city"
    t.string "sponsors"
    t.boolean "professional", default: true
  end

end
