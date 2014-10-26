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

ActiveRecord::Schema.define(version: 20141025184452) do

  create_table "users", force: true do |t|
    t.string   "name",               null: false
    t.string   "email",              null: false
    t.string   "password_digest",    null: false
    t.string   "employee_number"
    t.string   "screen_name"
    t.string   "screen_name_kana"
    t.string   "chat_id"
    t.string   "twitter_id"
    t.string   "github_id"
    t.string   "ghe_id"
    t.string   "phone_number"
    t.datetime "email_confirmed_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["employee_number"], name: "index_users_on_employee_number", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
