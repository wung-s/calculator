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

ActiveRecord::Schema.define(version: 20150710063835) do

  create_table "course_associations", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "department_id"
    t.integer  "semester",      limit: 2
    t.integer  "credit_hour",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "course_associations", ["course_id", "department_id"], name: "index_course_associations_on_course_id_and_department_id", unique: true
  add_index "course_associations", ["course_id"], name: "index_course_associations_on_course_id"
  add_index "course_associations", ["department_id"], name: "index_course_associations_on_department_id"

  create_table "courses", force: :cascade do |t|
    t.string   "code",       limit: 50
    t.string   "name",       limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "credits", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "department_id"
    t.integer  "credit_hour",   limit: 4
    t.integer  "int4",          limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "credits", ["course_id"], name: "index_credits_on_course_id"
  add_index "credits", ["department_id"], name: "index_credits_on_department_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "grade_points", force: :cascade do |t|
    t.string   "grade",      limit: 10
    t.integer  "point",      limit: 2
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "marks", force: :cascade do |t|
    t.integer  "internal",     limit: 4
    t.integer  "external",     limit: 4
    t.integer  "total",        limit: 4
    t.string   "grade",        limit: 10
    t.integer  "credit_point", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "student_id"
    t.integer  "course_id"
  end

  add_index "marks", ["course_id"], name: "index_marks_on_course_id"
  add_index "marks", ["student_id"], name: "index_marks_on_student_id"

  create_table "students", force: :cascade do |t|
    t.string   "regno",         limit: 50
    t.string   "first_name",    limit: 50
    t.string   "middle_name",   limit: 50
    t.string   "last_name",     limit: 50
    t.string   "email",         limit: 50
    t.text     "address",       limit: 500
    t.string   "state",         limit: 50
    t.integer  "pincode"
    t.integer  "emergency_no"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "department_id"
  end

  add_index "students", ["department_id"], name: "index_students_on_department_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end
