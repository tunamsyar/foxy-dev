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

ActiveRecord::Schema.define(version: 20171104081119) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "international_top_ups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status",                                default: 0
    t.integer  "ref_id",                                default: 0
    t.string   "phone_number"
    t.integer  "operator_id"
    t.datetime "created_at",                                        null: false
    t.string   "status_reply"
    t.decimal  "amount",       precision: 10, scale: 2
    t.decimal  "commission",   precision: 10, scale: 2
    t.datetime "updated_at",                                        null: false
  end

  create_table "operator_commissions", force: :cascade do |t|
    t.integer "operator_id"
    t.decimal "commission_percentage"
    t.integer "user_type"
  end

  create_table "operator_pins", force: :cascade do |t|
    t.string   "pins"
    t.integer  "status",      default: 0
    t.integer  "operator_id"
    t.integer  "amount"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operator_stores", force: :cascade do |t|
    t.integer  "operator_id"
    t.decimal  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "operators", force: :cascade do |t|
    t.string   "operator_name"
    t.integer  "local_international"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "reloads", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "source"
    t.string   "amount"
    t.string   "reference_no"
    t.integer  "status",           default: 0
    t.string   "message"
    t.string   "image"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "transaction_type"
    t.date     "transaction_date"
    t.datetime "transaction_time"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status",                                default: 0
    t.string   "phone_number"
    t.integer  "operator_id"
    t.datetime "created_at",                                        null: false
    t.string   "status_reply"
    t.decimal  "amount",       precision: 10, scale: 2
    t.decimal  "commission",   precision: 10, scale: 2
    t.datetime "updated_at",                                        null: false
  end

  create_table "user_pins", force: :cascade do |t|
    t.integer "pin_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "name"
    t.string   "phone_number"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wallets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "status"
    t.string   "reference_id"
    t.string   "balance"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
