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

ActiveRecord::Schema.define(version: 20151222015432) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "account",             limit: 255,                 null: false
    t.string   "password_digest",     limit: 255,                 null: false
    t.string   "name",                limit: 255,                 null: false
    t.boolean  "password_change_flg",             default: false, null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",              limit: 255,               null: false
    t.text     "overview",          limit: 65535
    t.integer  "follow_user_count", limit: 4,     default: 0, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "company_users", force: :cascade do |t|
    t.integer  "company_id",      limit: 4,   null: false
    t.string   "email",           limit: 255, null: false
    t.string   "password_digest", limit: 255, null: false
    t.string   "name",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
