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

ActiveRecord::Schema[8.1].define(version: 2026_02_13_001719) do
  create_table "schedules", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "tenant_id", null: false
    t.datetime "updated_at", null: false
    t.index ["tenant_id"], name: "index_schedules_on_tenant_id"
  end

  create_table "seats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "tenant_id", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["tenant_id"], name: "index_seats_on_tenant_id"
    t.index ["user_id"], name: "index_seats_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_tenants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "password_digest"
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "verification_token"
    t.boolean "verified", default: false
    t.index ["verification_token"], name: "index_users_on_verification_token", unique: true
  end

  add_foreign_key "schedules", "tenants"
  add_foreign_key "seats", "tenants"
  add_foreign_key "seats", "users"
  add_foreign_key "tenants", "users"
end
