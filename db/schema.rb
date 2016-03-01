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

ActiveRecord::Schema.define(version: 20160201112634) do

  create_table "images", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "image_url"
    t.string   "comment"
    t.boolean  "published",  default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "images", ["user_id"], name: "index_images_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "display_name"
    t.string "password"
  end

  add_index "users", ["display_name"], name: "index_users_on_display_name"
  add_index "users", ["username"], name: "index_users_on_username"

end
