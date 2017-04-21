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

ActiveRecord::Schema.define(version: 20170420181052) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "username"
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.integer  "sign_in_count",   default: 0,     null: false
    t.boolean  "super_admin",     default: false
    t.datetime "last_sign_in"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "booking_items", force: :cascade do |t|
    t.date     "start_date",            null: false
    t.date     "end_date",              null: false
    t.integer  "duration_in_minutes",   null: false
    t.integer  "last_order_in_minutes", null: false
    t.decimal  "price",                 null: false
    t.decimal  "slot_fee",              null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_reviews", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.integer  "listing_id",                 null: false
    t.decimal  "rating"
    t.string   "comment"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "recommend",  default: false
    t.index ["listing_id"], name: "index_customer_reviews_on_listing_id", using: :btree
    t.index ["user_id"], name: "index_customer_reviews_on_user_id", using: :btree
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "item_name"
    t.text     "description"
    t.integer  "booking_item_id"
    t.integer  "subscribe_item_id"
    t.integer  "purchase_item_id"
    t.json     "photos"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "type_id"
    t.integer  "outlet_id"
    t.index ["admin_id"], name: "index_listings_on_admin_id", using: :btree
    t.index ["booking_item_id"], name: "index_listings_on_booking_item_id", using: :btree
    t.index ["outlet_id"], name: "index_listings_on_outlet_id", using: :btree
    t.index ["purchase_item_id"], name: "index_listings_on_purchase_item_id", using: :btree
    t.index ["subscribe_item_id"], name: "index_listings_on_subscribe_item_id", using: :btree
    t.index ["type_id"], name: "index_listings_on_type_id", using: :btree
  end

  create_table "outlets", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "admin_id",     null: false
    t.string   "phone_number"
    t.string   "gmap_address", null: false
    t.float    "latitude",     null: false
    t.float    "longitude",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "detail"
    t.index ["admin_id"], name: "index_outlets_on_admin_id", using: :btree
  end

  create_table "purchase_items", force: :cascade do |t|
    t.integer  "quantity",   null: false
    t.integer  "price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "booking_item_id",             null: false
    t.datetime "started_at",                  null: false
    t.datetime "finished_at",                 null: false
    t.integer  "slot",                        null: false
    t.integer  "booking_count",   default: 0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["booking_item_id"], name: "index_schedules_on_booking_item_id", using: :btree
  end

  create_table "subscribe_items", force: :cascade do |t|
    t.integer  "capacity",           null: false
    t.integer  "capacity_count",     null: false
    t.integer  "subscribe_duration", null: false
    t.integer  "price",              null: false
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "types", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_types_on_category_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "provider"
    t.string   "uid"
  end

  add_foreign_key "listings", "outlets"
end
