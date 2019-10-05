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

ActiveRecord::Schema.define(version: 2019_09_24_104628) do

  create_table "meetings_items", force: :cascade do |t|
    t.string "date"
    t.float "amount"
    t.string "currency"
    t.string "con_change"
    t.string "reason"
    t.integer "meetings_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "completed_at"
    t.index ["meetings_list_id"], name: "index_meetings_items_on_meetings_list_id"
  end

  create_table "meetings_lists", force: :cascade do |t|
    t.string "title"
    t.text "responsible"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "meetings_items", "meetings_lists"
end
