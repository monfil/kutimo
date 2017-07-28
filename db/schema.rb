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

ActiveRecord::Schema.define(version: 20170726182242) do

  create_table "daily_records", force: :cascade do |t|
    t.integer  "user_goal_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_goal_id"], name: "index_daily_records_on_user_goal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string   "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_users_on_group_id"
    t.index ["user_id"], name: "index_group_users_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner"
  end

  create_table "rewards", force: :cascade do |t|
    t.string   "reward"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_goals", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "goal_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "accomplished", default: false
    t.index ["goal_id"], name: "index_user_goals_on_goal_id"
    t.index ["user_id"], name: "index_user_goals_on_user_id"
  end

  create_table "user_rewards", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reward_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "received",   default: false
    t.index ["reward_id"], name: "index_user_rewards_on_reward_id"
    t.index ["user_id"], name: "index_user_rewards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vulgarities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "count",      default: 0
    t.float    "amount",     default: 0.0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_vulgarities_on_user_id"
  end

end
