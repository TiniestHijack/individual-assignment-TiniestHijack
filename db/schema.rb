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

ActiveRecord::Schema.define(version: 2019_11_29_192728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

end
