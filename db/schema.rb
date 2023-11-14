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

ActiveRecord::Schema[7.1].define(version: 2023_11_14_175646) do
  create_table "bloodtypes", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email"
    t.integer "phone"
    t.bigint "user_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_contacts_on_country_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "countries", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "alpha3_code"
    t.bigint "language_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_countries_on_language_id"
  end

  create_table "destinies", charset: "utf8mb4", force: :cascade do |t|
    t.date "start_date"
    t.date "fishis_date"
    t.bigint "country_id", null: false
    t.bigint "travel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_destinies_on_country_id"
    t.index ["travel_id"], name: "index_destinies_on_travel_id"
  end

  create_table "diseases", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "travels", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "finish_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_travels_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "s_name"
    t.string "lastname"
    t.string "s_lastname"
    t.string "rut"
    t.string "passport"
    t.bigint "country_id"
    t.bigint "bloodtype_id"
    t.bigint "usertype_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bloodtype_id"], name: "index_users_on_bloodtype_id"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["passport"], name: "index_users_on_passport", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["rut"], name: "index_users_on_rut", unique: true
    t.index ["usertype_id"], name: "index_users_on_usertype_id"
  end

  create_table "usertypes", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contacts", "countries"
  add_foreign_key "contacts", "users"
  add_foreign_key "countries", "languages"
  add_foreign_key "destinies", "countries"
  add_foreign_key "destinies", "travels"
  add_foreign_key "travels", "users"
end
