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

ActiveRecord::Schema.define(version: 2019_12_06_190730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "postcode"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_addresses_on_customer_id"
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string "number"
    t.string "exp_date"
    t.string "name_on_card"
    t.string "organisation"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_credit_cards_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "Title"
    t.integer "Year"
    t.string "Director"
    t.integer "Duration"
    t.decimal "Rating"
    t.string "Content"
    t.integer "NumReviews"
    t.string "Country"
    t.bigint "Gross"
    t.bigint "Budget"
    t.string "Actor1"
    t.string "Actor2"
    t.string "Actor3"
    t.string "Genres"
    t.string "Keywords"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.bigint "credit_card_id", null: false
    t.bigint "customer_id", null: false
    t.bigint "purchase_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["credit_card_id"], name: "index_payments_on_credit_card_id"
    t.index ["customer_id"], name: "index_payments_on_customer_id"
    t.index ["purchase_id"], name: "index_payments_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "ownership"
    t.bigint "customer_id", null: false
    t.bigint "movie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_purchases_on_customer_id"
    t.index ["movie_id"], name: "index_purchases_on_movie_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_users_on_customer_id"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "customers"
  add_foreign_key "credit_cards", "customers"
  add_foreign_key "payments", "credit_cards"
  add_foreign_key "payments", "customers"
  add_foreign_key "payments", "purchases"
  add_foreign_key "purchases", "customers"
  add_foreign_key "purchases", "movies"
  add_foreign_key "users", "customers"
end
