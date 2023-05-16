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

ActiveRecord::Schema[7.0].define(version: 2023_03_30_155211) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "market_vendors", force: :cascade do |t|
    t.bigint "market_id", null: false
    t.bigint "vendor_id", null: false
    t.index ["market_id"], name: "index_market_vendors_on_market_id"
    t.index ["vendor_id"], name: "index_market_vendors_on_vendor_id"
  end

  create_table "markets", force: :cascade do |t|
    t.string "name", null: false
    t.string "street"
    t.string "city"
    t.string "county"
    t.string "state", null: false
    t.string "zip"
    t.string "lat"
    t.string "lon"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "contact_name", null: false
    t.string "contact_phone", null: false
    t.boolean "credit_accepted", null: false
  end

  add_foreign_key "market_vendors", "markets"
  add_foreign_key "market_vendors", "vendors"
end
