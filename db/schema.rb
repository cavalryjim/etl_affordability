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

ActiveRecord::Schema.define(version: 20160126035156) do

  create_table "coverages", force: :cascade do |t|
    t.integer  "employee_id"
    t.string   "plan_name"
    t.string   "outcome"
    t.date     "enrollment_date"
    t.date     "disenrollment_date"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.date     "offer_date"
  end

  add_index "coverages", ["employee_id"], name: "index_coverages_on_employee_id"

  create_table "dependents", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "ssn"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "dob"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "relationship"
  end

  add_index "dependents", ["employee_id"], name: "index_dependents_on_employee_id"

  create_table "employees", force: :cascade do |t|
    t.integer  "ssn"
    t.integer  "emp_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.date     "dob"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "transforms", force: :cascade do |t|
    t.string   "source_file_name"
    t.string   "output_file_name"
    t.string   "ip_address"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
