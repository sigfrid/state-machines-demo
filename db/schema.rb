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

ActiveRecord::Schema.define(version: 20160315010918) do

  create_table "case_state_transitions", force: :cascade do |t|
    t.integer  "case_id"
    t.string   "namespace"
    t.string   "event"
    t.string   "from"
    t.string   "to"
    t.datetime "created_at"
    t.text     "dump"
  end

  add_index "case_state_transitions", ["case_id"], name: "index_case_state_transitions_on_case_id"

  create_table "cases", force: :cascade do |t|
    t.string   "state"
    t.string   "name"
    t.string   "color"
    t.integer  "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_state_transitions", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "namespace"
    t.string   "event"
    t.string   "from"
    t.string   "to"
    t.datetime "created_at"
  end

  add_index "event_state_transitions", ["event_id"], name: "index_event_state_transitions_on_event_id"

  create_table "events", force: :cascade do |t|
    t.string   "description"
    t.string   "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "flow_id"
  end

  add_index "events", ["flow_id"], name: "index_events_on_flow_id"

  create_table "flows", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "case_state_transition_id"
    t.integer  "op_state_transition_id"
    t.string   "temperature"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "friendships", ["case_state_transition_id"], name: "index_friendships_on_case_state_transition_id"
  add_index "friendships", ["op_state_transition_id"], name: "index_friendships_on_op_state_transition_id"

  create_table "op_state_transitions", force: :cascade do |t|
    t.integer  "op_id"
    t.string   "namespace"
    t.string   "event"
    t.string   "from"
    t.string   "to"
    t.datetime "created_at"
  end

  add_index "op_state_transitions", ["op_id"], name: "index_op_state_transitions_on_op_id"

  create_table "ops", force: :cascade do |t|
    t.string   "name"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "event_id"
  end

  add_index "tags", ["event_id"], name: "index_tags_on_event_id"

end
