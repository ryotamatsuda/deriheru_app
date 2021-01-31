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

ActiveRecord::Schema.define(version: 2021_01_24_114326) do

  create_table "admins", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "login_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["login_id"], name: "index_admins_on_login_id", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "casts", force: :cascade do |t|
    t.string "name"
    t.string "line_id"
    t.string "email"
    t.integer "store_id"
    t.date "entryed_at"
    t.integer "course"
    t.string "phone_number"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "telephone_number"
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "home_address"
    t.string "memo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_customers_on_reset_password_token", unique: true
    t.index ["telephone_number"], name: "index_customers_on_telephone_number", unique: true
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "line_id"
    t.string "email"
    t.integer "wage"
    t.string "gasoline"
    t.time "attende_at"
    t.string "type_of_car"
    t.string "car_number"
    t.string "memo"
    t.integer "phone_number"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "operators", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "login_id", null: false
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["login_id"], name: "index_operators_on_login_id", unique: true
    t.index ["reset_password_token"], name: "index_operators_on_reset_password_token", unique: true
  end

  create_table "orders", force: :cascade do |t|
    t.integer "status", default: 0
    t.datetime "started_at"
    t.datetime "finished_at"
    t.integer "duration_minutes"
    t.integer "extended_duration_minutes"
    t.boolean "is_pre_contracted"
    t.integer "operator_id"
    t.integer "customer_id"
    t.integer "cast_id"
    t.integer "designate_method"
    t.integer "course"
    t.string "option"
    t.string "discount"
    t.integer "place_kind"
    t.string "home_address"
    t.integer "hotel_id"
    t.integer "payment_method"
    t.integer "total_fee"
    t.integer "cast_cost"
    t.integer "store_cost"
    t.integer "transportation_cost"
    t.integer "designate_fee"
    t.integer "cast_discount_cost"
    t.integer "store_discount_cost"
    t.integer "cast_option"
    t.integer "store_option"
    t.integer "extended_fee"
    t.integer "credit_card_cost"
    t.integer "credit_card_rate"
    t.string "order_data"
    t.string "notification"
    t.boolean "confirmation_contacted"
    t.integer "send_driver_id"
    t.integer "pickup_driver_id"
    t.boolean "receipt_gived", default: false
    t.integer "store_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.boolean "have_course"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
