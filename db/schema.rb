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

ActiveRecord::Schema.define(version: 20150901035424) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "ancestry",   limit: 255
    t.integer  "nodetype",   limit: 4
    t.string   "code",       limit: 255
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry", using: :btree

  create_table "charging_areas", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "code_troubleshootings", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "code",            limit: 255
    t.integer  "trouble_type_id", limit: 4
    t.text     "shooting",        limit: 65535
    t.integer  "order_num",       limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "customer_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "order_num",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.string   "meter_no",           limit: 255
    t.integer  "district_id",        limit: 4
    t.integer  "community_id",       limit: 4
    t.integer  "building_id",        limit: 4
    t.integer  "unit",               limit: 4
    t.integer  "floor",              limit: 4
    t.integer  "room",               limit: 4
    t.integer  "heating_status_id",  limit: 4
    t.string   "address",            limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "room_old_code",      limit: 255
    t.boolean  "is_metering",        limit: 1
    t.integer  "customer_type_id",   limit: 4
    t.integer  "metering_type_id",   limit: 4
    t.integer  "meter_status_id",    limit: 4
    t.integer  "heating_type_id",    limit: 4
    t.float    "heating_area",       limit: 24
    t.integer  "charging_area_id",   limit: 4
    t.integer  "heating_station_id", limit: 4
    t.float    "meter_base_num",     limit: 24
    t.float    "hv_current",         limit: 24
    t.float    "hv_last",            limit: 24
    t.float    "hv_last2",           limit: 24
  end

  create_table "heating_stations", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "code",             limit: 255
    t.integer  "district_id",      limit: 4
    t.integer  "charging_area_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "heating_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "heating_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.integer  "customer_id",     limit: 4
    t.integer  "team_id",         limit: 4
    t.string   "worker",          limit: 255
    t.date     "work_date"
    t.integer  "meter_status_id", limit: 4
    t.float    "hv",              limit: 24
    t.string   "remark",          limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "meter_brands", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "supplier",   limit: 255
    t.string   "contact",    limit: 255
    t.string   "phone",      limit: 255
    t.integer  "order_num",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "meter_changings", force: :cascade do |t|
    t.integer  "customer_id", limit: 4
    t.integer  "team_id",     limit: 4
    t.string   "worker",      limit: 255
    t.string   "work_date",   limit: 255
    t.string   "datetime",    limit: 255
    t.string   "past_no",     limit: 255
    t.float    "past_val",    limit: 24
    t.string   "current_no",  limit: 255
    t.float    "current_val", limit: 24
    t.string   "remark",      limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "meter_statuses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "remark",     limit: 255
    t.integer  "order_num",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "metering_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "problem_customers", force: :cascade do |t|
    t.string   "workorder_no",       limit: 255
    t.integer  "customer_id",        limit: 4
    t.integer  "meter_brand_id",     limit: 4
    t.string   "past_meterno",       limit: 255
    t.string   "changing_meterno",   limit: 255
    t.float    "past_basenum",       limit: 24
    t.float    "past_val",           limit: 24
    t.float    "current_basenum",    limit: 24
    t.float    "current_val",        limit: 24
    t.integer  "team_id",            limit: 4
    t.integer  "troubleshooting_id", limit: 4
    t.string   "analysis",           limit: 255
    t.string   "solving",            limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "order_number", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "code",         limit: 255
  end

  create_table "trouble_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
