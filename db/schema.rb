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

ActiveRecord::Schema.define(version: 2021_04_29_132115) do

  create_table "addresses", force: :cascade do |t|
    t.string "address_line"
    t.string "street_name"
    t.integer "number"
    t.string "comment"
    t.string "zip_code"
    t.string "city"
    t.string "country_id"
    t.string "country_name"
    t.string "neighborhood"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "billing_infos", force: :cascade do |t|
    t.integer "buyer_id", null: false
    t.string "doc_type"
    t.string "doc_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_billing_infos_on_buyer_id"
  end

  create_table "buyers", force: :cascade do |t|
    t.string "nickname"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "store_id", null: false
    t.date "date_closed"
    t.float "total_amount"
    t.float "total_shipping"
    t.float "total_amount_with_shipping"
    t.float "expiration_date"
    t.string "status"
    t.integer "buyer_id", null: false
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
    t.index ["store_id"], name: "index_orders_on_store_id"
  end

  create_table "orders_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "item_id", null: false
    t.integer "quantity"
    t.float "unit_price"
    t.float "full_unit_price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_orders_items_on_item_id"
    t.index ["order_id"], name: "index_orders_items_on_order_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "buyer_id", null: false
    t.integer "installments"
    t.string "payment_type"
    t.string "status"
    t.float "transaction_amount"
    t.float "taxes_amount"
    t.float "shipping_cost"
    t.float "total_paid_amount"
    t.float "installment_amount"
    t.date "date_approved"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_payments_on_buyer_id"
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "phones", force: :cascade do |t|
    t.integer "buyer_id", null: false
    t.integer "area_code"
    t.integer "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_phones_on_buyer_id"
  end

  create_table "shippings", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "shipment_type"
    t.integer "address_id", null: false
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_shippings_on_address_id"
    t.index ["order_id"], name: "index_shippings_on_order_id"
  end

  create_table "stores", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "location"
  end

  add_foreign_key "billing_infos", "buyers"
  add_foreign_key "orders", "buyers"
  add_foreign_key "orders", "stores"
  add_foreign_key "orders_items", "items"
  add_foreign_key "orders_items", "orders"
  add_foreign_key "payments", "buyers"
  add_foreign_key "payments", "orders"
  add_foreign_key "phones", "buyers"
  add_foreign_key "shippings", "addresses"
  add_foreign_key "shippings", "orders"
end
