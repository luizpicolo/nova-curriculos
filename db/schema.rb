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

ActiveRecord::Schema.define(version: 20140724044751) do

  create_table "academic_trainings", force: true do |t|
    t.string   "schooling",      null: false
    t.string   "name_of_course", null: false
    t.date     "start_date",     null: false
    t.date     "finish_date"
    t.string   "institution",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "candidate_id"
  end

  create_table "candidates", force: true do |t|
    t.boolean  "is_male",            null: false
    t.date     "bith_date",          null: false
    t.integer  "zip_code"
    t.string   "street"
    t.integer  "number"
    t.string   "complement"
    t.string   "home_fone"
    t.string   "mobile_phone"
    t.text     "courses_and_events"
    t.integer  "city_id",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image"
  end

  add_index "candidates", ["city_id"], name: "index_candidates_on_city_id", using: :btree

  create_table "candidates_hierarchical_levels", force: true do |t|
    t.integer  "candidate_id"
    t.integer  "hierarchical_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "candidates_professional_areas", force: true do |t|
    t.integer  "candidate_id"
    t.integer  "professional_area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hierarchical_levels", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professional_areas", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professional_experiences", force: true do |t|
    t.string   "name_company",                 null: false
    t.string   "last_post",                    null: false
    t.date     "start_date",                   null: false
    t.date     "finish_date"
    t.boolean  "jobs_current", default: false, null: false
    t.text     "attributions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "candidate_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.boolean  "is_candidate",           default: true,  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
