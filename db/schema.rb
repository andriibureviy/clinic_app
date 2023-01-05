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

ActiveRecord::Schema[7.0].define(version: 2023_01_05_122008) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_doctors", id: false, force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "doctor_id"
    t.index ["category_id"], name: "index_categories_doctors_on_category_id"
    t.index ["doctor_id"], name: "index_categories_doctors_on_doctor_id"
  end

  create_table "doctor_user_communications", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id", "user_id"], name: "index_doctor_user_communications_on_doctor_id_and_user_id", unique: true
    t.index ["doctor_id"], name: "index_doctor_user_communications_on_doctor_id"
    t.index ["user_id"], name: "index_doctor_user_communications_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "name"
    t.integer "open_records_count", default: 0
    t.string "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.index ["uuid"], name: "index_doctors_on_uuid", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "recommendation"
    t.string "uuid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "doctor_user_communications", "doctors"
  add_foreign_key "doctor_user_communications", "users"
end
