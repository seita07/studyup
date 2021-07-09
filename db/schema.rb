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

ActiveRecord::Schema.define(version: 2021_07_09_013021) do

  create_table "books", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "img_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "timepost_id"
    t.text "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["timepost_id"], name: "index_comments_on_timepost_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "countdowns", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.string "omment"
    t.datetime "event_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "method_likes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "methodpost_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["methodpost_id"], name: "index_method_likes_on_methodpost_id"
    t.index ["user_id"], name: "index_method_likes_on_user_id"
  end

  create_table "methodposts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.text "title"
    t.string "subjects"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_methodposts_on_user_id"
  end

  create_table "relationships", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "follow_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["user_id", "follow_id"], name: "index_relationships_on_user_id_and_follow_id", unique: true
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "reviews", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "methodpost_id"
    t.text "text", null: false
    t.float "evaluation", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["methodpost_id"], name: "index_reviews_on_methodpost_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "studytimes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "studytime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "time_likes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "timepost_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["timepost_id"], name: "index_time_likes_on_timepost_id"
    t.index ["user_id"], name: "index_time_likes_on_user_id"
  end

  create_table "timeposts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.text "content"
    t.integer "time"
    t.string "subjects"
    t.integer "minitus"
    t.string "img"
    t.integer "total_time"
    t.datetime "datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "created_at"], name: "index_timeposts_on_user_id_and_created_at"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "occupation"
    t.string "target_school"
    t.text "comment"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "books", "users"
  add_foreign_key "comments", "timeposts"
  add_foreign_key "comments", "users"
  add_foreign_key "method_likes", "methodposts"
  add_foreign_key "method_likes", "users"
  add_foreign_key "methodposts", "users"
  add_foreign_key "relationships", "users"
  add_foreign_key "relationships", "users", column: "follow_id"
  add_foreign_key "reviews", "methodposts"
  add_foreign_key "reviews", "users"
  add_foreign_key "time_likes", "timeposts"
  add_foreign_key "time_likes", "users"
end
