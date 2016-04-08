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

ActiveRecord::Schema.define(version: 20160408064154) do

  create_table "boxes", force: :cascade do |t|
    t.integer  "flow_version_id"
    t.integer  "step_version_id"
    t.string   "activity"
    t.datetime "created_at"
  end

  add_index "boxes", ["flow_version_id", "step_version_id"], name: "index_boxes_on_flow_version_id_and_step_version_id"
  add_index "boxes", ["flow_version_id"], name: "index_boxes_on_flow_version_id"
  add_index "boxes", ["step_version_id"], name: "index_boxes_on_step_version_id"

  create_table "flow_versions", force: :cascade do |t|
    t.string   "flow_id"
    t.string   "name"
    t.string   "color"
    t.integer  "size"
    t.datetime "created_at"
    t.string   "state"
  end

  create_table "flows", force: :cascade do |t|
    t.string   "name"
    t.string   "color"
    t.integer  "size"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "step_versions", force: :cascade do |t|
    t.string   "step_id"
    t.string   "name"
    t.integer  "position"
    t.datetime "created_at"
    t.string   "state"
  end

  create_table "steps", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
