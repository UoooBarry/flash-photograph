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

ActiveRecord::Schema.define(version: 2021_11_15_065344) do

  create_table "devices", charset: "utf8mb4", force: :cascade do |t|
    t.string "fingerpint"
    t.string "user_agent"
    t.string "last_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "photographs", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "device_id"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "url"
    t.integer "image_width"
    t.integer "image_height"
    t.index ["device_id"], name: "index_photographs_on_device_id"
  end

  create_table "vieweds", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "photograph_id", null: false
    t.bigint "device_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "tapped"
    t.index ["device_id"], name: "index_vieweds_on_device_id"
    t.index ["photograph_id"], name: "index_vieweds_on_photograph_id"
  end

  add_foreign_key "photographs", "devices"
  add_foreign_key "vieweds", "devices"
  add_foreign_key "vieweds", "photographs"
end
