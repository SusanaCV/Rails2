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

ActiveRecord::Schema.define(version: 20160330101620) do

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "products", ["user_id"], name: "index_products_on_user_id", using: :btree

  create_table "sessions", force: true do |t|
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.datetime "fecha_creacion"
  end

  create_table "transactions", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "product_id_req"
    t.integer  "product_id_offered"
  end

  add_index "transactions", ["product_id_offered"], name: "index_transactions_on_product_id_id", using: :btree
  add_index "transactions", ["product_id_req"], name: "index_transactions_on_product_id", using: :btree
  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.integer  "password"
    t.string   "firsname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
