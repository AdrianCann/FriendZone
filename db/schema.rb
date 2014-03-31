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

ActiveRecord::Schema.define(version: 20140331210629) do

  create_table "friend_zone_memberships", force: true do |t|
    t.integer  "friend_zone_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friend_zone_memberships", ["friend_id"], name: "index_friend_zone_memberships_on_friend_id"
  add_index "friend_zone_memberships", ["friend_zone_id"], name: "index_friend_zone_memberships_on_friend_zone_id"

  create_table "friend_zones", force: true do |t|
    t.string   "group_name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friend_zones", ["user_id"], name: "index_friend_zones_on_user_id"

  create_table "links", force: true do |t|
    t.string   "url"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["post_id"], name: "index_links_on_post_id"

  create_table "post_shares", force: true do |t|
    t.integer  "post_id"
    t.integer  "friend_zone_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_shares", ["friend_zone_id"], name: "index_post_shares_on_friend_zone_id"
  add_index "post_shares", ["post_id"], name: "index_post_shares_on_post_id"

  create_table "posts", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "access_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["access_token"], name: "index_users_on_access_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
