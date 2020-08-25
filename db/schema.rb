# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_08_000000) do

  create_table "answer_comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "comment", limit: 511
    t.datetime "answer_confirmed_at", null: false
    t.integer "answer_confirmed_user_id"
    t.integer "answer_id"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_confirmed_user_id"], name: "index_answer_comments_on_answer_confirmed_user_id"
    t.index ["answer_id"], name: "index_answer_comments_on_answer_id"
  end

  create_table "answer_contents", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "answer_option_id"
    t.integer "question_id"
    t.integer "answer_id"
    t.string "content", limit: 511
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answer_contents_on_answer_id"
    t.index ["answer_option_id"], name: "index_answer_contents_on_answer_option_id"
    t.index ["question_id"], name: "index_answer_contents_on_question_id"
  end

  create_table "answer_options", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "question_id"
    t.string "content", limit: 100, null: false
    t.boolean "is_alert", default: false, null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answer_options_on_question_id"
  end

  create_table "answers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "emergency_contacts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "phone_number", limit: 11
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phone_number"], name: "index_emergency_contacts_on_phone_number", unique: true
  end

  create_table "mail_templates", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "template", limit: 1000, null: false
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_mail_templates_on_name", unique: true
  end

  create_table "notification_emails", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "email", limit: 128, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_notification_emails_on_email", unique: true
  end

  create_table "prefectures", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.integer "display_order", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_prefectures_on_name", unique: true
  end

  create_table "question_types", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_question_types_on_name", unique: true
  end

  create_table "questions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "content", limit: 300, null: false
    t.integer "question_type_id"
    t.boolean "is_deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_type_id"], name: "index_questions_on_question_type_id"
  end

  create_table "referral_hospitals", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.integer "user_id"
    t.string "hospital_name", null: false
    t.string "referral_status", limit: 1000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_referral_hospitals_on_user_id"
  end

  create_table "user_roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_user_roles_on_name", unique: true
  end

  create_table "user_statuses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "name", limit: 45, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_user_statuses_on_name", unique: true
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", limit: 511, null: false
    t.string "disclose_id", limit: 12, null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "gender", limit: 10, null: false
    t.string "address", limit: 511, null: false
    t.string "phone_number", limit: 11, null: false
    t.date "home_remedy_start_on"
    t.string "affiliation", limit: 128
    t.integer "user_status_id"
    t.integer "user_role_id"
    t.integer "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disclose_id"], name: "index_users_on_disclose_id", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["prefecture_id"], name: "index_users_on_prefecture_id"
    t.index ["user_role_id"], name: "index_users_on_user_role_id"
    t.index ["user_status_id"], name: "index_users_on_user_status_id"
  end

  add_foreign_key "answer_comments", "answers"
  add_foreign_key "answer_comments", "users", column: "answer_confirmed_user_id"
  add_foreign_key "answer_contents", "answer_options"
  add_foreign_key "answer_contents", "answers"
  add_foreign_key "answer_contents", "questions"
  add_foreign_key "answer_options", "questions"
  add_foreign_key "answers", "users"
  add_foreign_key "questions", "question_types"
  add_foreign_key "referral_hospitals", "users"
  add_foreign_key "users", "prefectures"
  add_foreign_key "users", "user_roles"
  add_foreign_key "users", "user_statuses"
end
