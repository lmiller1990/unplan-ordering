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

ActiveRecord::Schema.define(version: 20160809212316) do

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "shopping_list_id"
  end

  create_table "product_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "theshold_to_order"
    t.integer  "in_stock",          default: 0
    t.integer  "price"
    t.string   "name"
    t.string   "day_to_order"
    t.string   "unit_type"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "order_id"
    t.integer  "product_list_id"
    t.boolean  "base_product",      default: false, null: false
    t.integer  "desired_total"
    t.integer  "stockup_total"
  end

  create_table "shopping_items", force: :cascade do |t|
    t.integer  "item_amount"
    t.integer  "item_cost"
    t.integer  "total_cost"
    t.string   "item_name"
    t.integer  "shopping_list_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "need_to_order",    default: false
    t.index ["shopping_list_id"], name: "index_shopping_items_on_shopping_list_id"
  end

  create_table "shopping_lists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

end
