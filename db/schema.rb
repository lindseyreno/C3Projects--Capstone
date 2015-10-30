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

ActiveRecord::Schema.define(version: 20151030164355) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_events", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "event_id",    null: false
  end

  add_index "categories_events", ["category_id", "event_id"], name: "index_categories_events_on_category_id_and_event_id", unique: true, using: :btree

  create_table "categories_users", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "user_id",     null: false
  end

  add_index "categories_users", ["category_id", "user_id"], name: "index_categories_users_on_category_id_and_user_id", using: :btree
  add_index "categories_users", ["user_id", "category_id"], name: "index_categories_users_on_user_id_and_category_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.text     "title"
    t.text     "date"
    t.text     "location"
    t.text     "url"
    t.text     "email"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "topics"
  end

  create_table "schedules", force: :cascade do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "username"
    t.text     "email"
    t.text     "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "schedule_id"
  end

  add_foreign_key "users", "schedules"
end
