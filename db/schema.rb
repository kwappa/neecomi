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

ActiveRecord::Schema.define(version: 20141101185735) do

  create_table "blog_contents", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "slug"
    t.text     "body"
    t.datetime "published_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "blog_contents", ["published_at"], name: "index_blog_contents_on_published_at"
  add_index "blog_contents", ["user_id", "slug"], name: "index_blog_contents_on_user_id_and_slug", unique: true
  add_index "blog_contents", ["user_id"], name: "index_blog_contents_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name",                   null: false
    t.string   "email",                  null: false
    t.string   "encrypted_password",     null: false
    t.string   "member_number"
    t.string   "screen_name"
    t.string   "screen_name_kana"
    t.string   "nick"
    t.text     "profile"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["member_number"], name: "index_users_on_member_number", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
