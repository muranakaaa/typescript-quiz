# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_01_02_054336) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.string "option1"
    t.string "option2"
    t.string "option3"
    t.string "option4"
    t.integer "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_answer_details", force: :cascade do |t|
    t.bigint "user_answer_id", null: false
    t.bigint "question_id", null: false
    t.integer "user_choice"
    t.boolean "is_correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_user_answer_details_on_question_id"
    t.index ["user_answer_id"], name: "index_user_answer_details_on_user_answer_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_answer_details", "questions"
  add_foreign_key "user_answer_details", "user_answers"
end
