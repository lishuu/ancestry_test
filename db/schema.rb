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

ActiveRecord::Schema.define(version: 20150820142845) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.integer  "nodetype"
    t.string   "code"
  end

  add_index "categories", ["ancestry"], name: "index_categories_on_ancestry"

  create_table "charging_areas", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "code_troubleshootings", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "trouble_type_id"
    t.text     "shooting"
    t.integer  "order_num"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "customer_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "order_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "meter_no"
    t.integer  "district_id"
    t.integer  "community_id"
    t.integer  "building_id"
    t.integer  "unit"
    t.integer  "floor"
    t.integer  "room"
    t.integer  "heating_status_id"
    t.string   "address"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "room_old_code"
    t.boolean  "is_metering"
    t.integer  "customer_type_id"
    t.integer  "metering_type_id"
    t.integer  "meter_status_id"
    t.integer  "heating_type_id"
    t.float    "heating_area"
    t.integer  "charging_area_id"
    t.integer  "heating_station_id"
    t.float    "meter_base_num"
    t.float    "hv_current"
    t.float    "hv_last"
    t.float    "hv_last2"
  end

  create_table "heating_stations", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "district_id"
    t.integer  "charging_area_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "heating_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "heating_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "team_id"
    t.string   "worker"
    t.date     "work_date"
    t.integer  "meter_status_id"
    t.float    "hv"
    t.string   "remark"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "meter_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "remark"
    t.integer  "order_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "metering_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.integer  "order_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "trouble_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
