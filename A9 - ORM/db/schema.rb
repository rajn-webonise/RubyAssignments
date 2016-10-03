# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161003191909) do

  create_table "buyers", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: :cascade do |t|
    t.string   "item_name",  null: false
    t.integer  "quantity",   null: false
    t.integer  "price",      null: false
    t.integer  "discount"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "total_amount", null: false
    t.integer  "buyer_id"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["buyer_id"], name: "index_orders_on_buyer_id"

  create_table "products", force: :cascade do |t|
    t.integer  "seller_id"
    t.string   "name",        null: false
    t.integer  "price",       null: false
    t.integer  "quantity",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["seller_id"], name: "index_products_on_seller_id"

  create_table "sellers", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
