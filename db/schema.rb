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

ActiveRecord::Schema.define(version: 20140909013654) do

  create_table "academic_trainings", force: true do |t|
    t.string   "schooling_id",   null: false
    t.string   "name_of_course", null: false
    t.date     "start_date",     null: false
    t.date     "finish_date"
    t.string   "institution",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "candidate_id",   null: false
  end

  create_table "branch_operations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "branch_operations_companies", force: true do |t|
    t.integer  "branch_operation_id", null: false
    t.integer  "company_id",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "branch_operations_companies", ["branch_operation_id"], name: "index_branch_operations_companies_on_branch_operation_id", using: :btree
  add_index "branch_operations_companies", ["company_id"], name: "index_branch_operations_companies_on_company_id", using: :btree

  create_table "candidates", force: true do |t|
    t.boolean  "is_male",                              null: false
    t.date     "birth_date",                           null: false
    t.string   "zip_code"
    t.string   "street"
    t.integer  "number"
    t.string   "complement"
    t.string   "home_phone"
    t.string   "mobile_phone"
    t.integer  "city_id",                              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                              null: false
    t.string   "image"
    t.string   "full_name"
    t.string   "commercial_phone"
    t.string   "message_phone"
    t.text     "mini_curriculum"
    t.string   "suburb"
    t.string   "position_of_interest"
    t.string   "salary_pretension"
    t.string   "last_salary"
    t.boolean  "salary_to_be_agreed",  default: false
    t.boolean  "this_active",          default: false, null: false
    t.boolean  "is_public",            default: true,  null: false
    t.boolean  "term",                 default: false, null: false
    t.boolean  "avatar_processing",    default: false, null: false
  end

  add_index "candidates", ["city_id"], name: "index_candidates_on_city_id", using: :btree

  create_table "candidates_hierarchical_levels", force: true do |t|
    t.integer  "candidate_id",          null: false
    t.integer  "hierarchical_level_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidates_hierarchical_levels", ["candidate_id"], name: "index_candidates_hierarchical_levels_on_candidate_id", using: :btree
  add_index "candidates_hierarchical_levels", ["hierarchical_level_id"], name: "index_candidates_hierarchical_levels_on_hierarchical_level_id", using: :btree

  create_table "candidates_jobs", force: true do |t|
    t.integer  "candidate_id", null: false
    t.integer  "job_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidates_jobs", ["candidate_id"], name: "index_candidates_jobs_on_candidate_id", using: :btree
  add_index "candidates_jobs", ["job_id"], name: "index_candidates_jobs_on_job_id", using: :btree

  create_table "candidates_professional_areas", force: true do |t|
    t.integer  "candidate_id",         null: false
    t.integer  "professional_area_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "candidates_professional_areas", ["candidate_id"], name: "index_candidates_professional_areas_on_candidate_id", using: :btree
  add_index "candidates_professional_areas", ["professional_area_id"], name: "index_candidates_professional_areas_on_professional_area_id", using: :btree

  create_table "cities", force: true do |t|
    t.string   "name",       null: false
    t.integer  "state_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "fancy_name"
    t.string   "corporate_name"
    t.string   "phone"
    t.string   "street"
    t.integer  "number"
    t.string   "facebook"
    t.string   "website"
    t.integer  "type_company_id",                   null: false
    t.string   "cnpj"
    t.integer  "city_id",                           null: false
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "logo"
    t.string   "twitter"
    t.integer  "lg"
    t.integer  "lt"
    t.boolean  "avatar_processing", default: false, null: false
  end

  add_index "companies", ["city_id"], name: "index_companies_on_city_id", using: :btree
  add_index "companies", ["type_company_id"], name: "index_companies_on_type_company_id", using: :btree

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "extra_courses", force: true do |t|
    t.string   "name"
    t.string   "local"
    t.text     "description"
    t.integer  "candidate_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "extra_courses", ["candidate_id"], name: "index_extra_courses_on_candidate_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "hierarchical_levels", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.integer  "company_id",                   null: false
    t.integer  "job_id",                       null: false
    t.string   "price"
    t.string   "status",         default: "0"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "payment_method"
  end

  add_index "invoices", ["company_id"], name: "index_invoices_on_company_id", using: :btree
  add_index "invoices", ["job_id"], name: "index_invoices_on_job_id", using: :btree

  create_table "job_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_premiuns", force: true do |t|
    t.date     "start_date"
    t.date     "finish_date"
    t.integer  "job_id",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "job_premiuns", ["job_id"], name: "index_job_premiuns_on_job_id", using: :btree

  create_table "jobs", force: true do |t|
    t.string   "job_title"
    t.integer  "company_id",                        null: false
    t.string   "salary_range"
    t.integer  "type_contract_id",                  null: false
    t.integer  "job_category_id",                   null: false
    t.integer  "amount_vacancies"
    t.string   "time_contract"
    t.text     "description"
    t.text     "requirements"
    t.text     "period_of_work"
    t.text     "other_information"
    t.date     "start_date"
    t.date     "finish_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",                              null: false
    t.integer  "city_id",                           null: false
    t.boolean  "salary_negotiable"
    t.boolean  "is_premium",        default: false
    t.boolean  "status",            default: false
    t.boolean  "term",              default: false, null: false
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["job_category_id"], name: "index_jobs_on_job_category_id", using: :btree
  add_index "jobs", ["type_contract_id"], name: "index_jobs_on_type_contract_id", using: :btree

  create_table "languages", force: true do |t|
    t.string   "speech"
    t.integer  "level"
    t.integer  "candidate_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "languages", ["candidate_id"], name: "index_languages_on_candidate_id", using: :btree

  create_table "premium_plans", force: true do |t|
    t.string   "price"
    t.string   "description"
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
    t.integer  "candidate_id",                 null: false
  end

  create_table "schoolings", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: true do |t|
    t.string   "name"
    t.integer  "country_id",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "iso",        limit: 5
  end

  add_index "states", ["country_id"], name: "index_states_on_country_id", using: :btree

  create_table "type_companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_contracts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "provider"
    t.string   "uid"
    t.string   "slug"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
