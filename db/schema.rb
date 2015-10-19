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

ActiveRecord::Schema.define(version: 20151019163918) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "num_val"
    t.string   "text_val"
    t.boolean  "bool_val"
    t.integer  "question_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "phone",      null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "diaries", force: :cascade do |t|
    t.boolean  "filled_in_session"
    t.integer  "times_filled"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "diaries", ["user_id"], name: "index_diaries_on_user_id", using: :btree

  create_table "diaries_questions", id: false, force: :cascade do |t|
    t.integer "diary_id",    null: false
    t.integer "question_id", null: false
  end

  add_index "diaries_questions", ["diary_id", "question_id"], name: "index_diaries_questions_on_diary_id_and_question_id", using: :btree
  add_index "diaries_questions", ["question_id", "diary_id"], name: "index_diaries_questions_on_question_id_and_diary_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.string   "text",        null: false
    t.string   "category"
    t.string   "answer_type", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "category",                    null: false
    t.string   "text",                        null: false
    t.string   "acronym"
    t.boolean  "favorite",    default: false, null: false
    t.text     "description",                 null: false
    t.integer  "user_id"
    t.integer  "diary_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "skills", ["diary_id"], name: "index_skills_on_diary_id", using: :btree
  add_index "skills", ["user_id"], name: "index_skills_on_user_id", using: :btree

  create_table "therapists", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "phone",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "username",        null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "therapist_id"
    t.string   "remember_digest"
  end

  add_index "users", ["therapist_id"], name: "index_users_on_therapist_id", using: :btree

  add_foreign_key "answers", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "contacts", "users"
  add_foreign_key "diaries", "users"
  add_foreign_key "skills", "diaries"
  add_foreign_key "skills", "users"
  add_foreign_key "users", "therapists"
end
