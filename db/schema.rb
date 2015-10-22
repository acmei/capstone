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

ActiveRecord::Schema.define(version: 20151022040439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.datetime "date"
    t.integer  "num"
    t.string   "text"
    t.boolean  "bool"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "text"
    t.string   "category"
    t.string   "answer_type"
    t.integer  "recurrence"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions_users", id: false, force: :cascade do |t|
    t.integer "user_id",     null: false
    t.integer "question_id", null: false
  end

  add_index "questions_users", ["question_id", "user_id"], name: "index_questions_users_on_question_id_and_user_id", using: :btree
  add_index "questions_users", ["user_id", "question_id"], name: "index_questions_users_on_user_id_and_question_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "text"
    t.string   "category"
    t.string   "acronym"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skills_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "skill_id", null: false
  end

  add_index "skills_users", ["skill_id", "user_id"], name: "index_skills_users_on_skill_id_and_user_id", using: :btree
  add_index "skills_users", ["user_id", "skill_id"], name: "index_skills_users_on_user_id_and_skill_id", using: :btree

  create_table "therapists", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activaton_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.integer  "photo_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "session_day"
    t.string   "uid"
    t.string   "provider"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.integer  "photo_id"
    t.integer  "therapist_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
