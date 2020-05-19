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

ActiveRecord::Schema.define(version: 2020_05_19_105832) do

  create_table "bestellings", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.string "address"
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "isBezorgd"
    t.decimal "price"
    t.integer "user_id"
    t.index ["cart_id"], name: "index_bestellings_on_cart_id"
  end

# Could not dump table "carts" because of following StandardError
#   Unknown type '' for column 'arr'

  create_table "carts_product_sauces", id: false, force: :cascade do |t|
    t.integer "product_sauce_id", null: false
    t.integer "cart_id", null: false
    t.index ["cart_id"], name: "index_carts_product_sauces_on_cart_id"
    t.index ["product_sauce_id"], name: "index_carts_product_sauces_on_product_sauce_id"
  end

  create_table "full_orders", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "address"
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_full_orders_on_order_id"
  end

  create_table "product_sauces", force: :cascade do |t|
    t.integer "product_id", null: false
    t.integer "sauce_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cart_id"
    t.integer "quantity"
    t.index ["product_id"], name: "index_product_sauces_on_product_id"
    t.index ["sauce_id"], name: "index_product_sauces_on_sauce_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "description"
  end

  create_table "sauces", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.integer "bestelling_id"
    t.string "address"
    t.string "number"
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bestellings", "carts"
  add_foreign_key "full_orders", "orders"
  add_foreign_key "product_sauces", "products"
  add_foreign_key "product_sauces", "sauces"
end
