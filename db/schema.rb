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

ActiveRecord::Schema.define(version: 20151108180057) do

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
  end

  add_index "accounts", ["email"], name: "index_accounts_on_email", unique: true
  add_index "accounts", ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "data_points", force: :cascade do |t|
    t.integer  "goal_id"
    t.decimal  "desired_amount", default: 0.0
    t.decimal  "actual_amount",  default: 0.0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.date     "due_date"
  end

  create_table "expense_payments", force: :cascade do |t|
    t.decimal  "amount"
    t.datetime "due_date"
    t.datetime "payment_date"
    t.boolean  "paid",         default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "expense_id"
  end

  add_index "expense_payments", ["expense_id"], name: "index_expense_payments_on_expense_id"

  create_table "expenses", force: :cascade do |t|
    t.text     "name"
    t.decimal  "amount"
    t.date     "dueDate"
    t.date     "paymentDate"
    t.decimal  "lateFee",     default: 0.0
    t.decimal  "apr",         default: 0.0
    t.boolean  "paid",        default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "account_id"
    t.integer  "category_id"
  end

  add_index "expenses", ["account_id"], name: "index_expenses_on_account_id"
  add_index "expenses", ["category_id"], name: "index_expenses_on_category_id"

  create_table "goals", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date"
    t.string   "duration"
    t.string   "frequency"
    t.decimal  "desired_total", default: 0.0
    t.decimal  "actual_total",  default: 0.0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "income_payments", force: :cascade do |t|
    t.decimal  "gross_income"
    t.decimal  "net_income"
    t.date     "paymentDate"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "account_id"
  end

  add_index "income_payments", ["account_id"], name: "index_income_payments_on_account_id"

  create_table "incomes", force: :cascade do |t|
    t.text     "income_source"
    t.text     "category"
    t.decimal  "gross_income"
    t.decimal  "net_income"
    t.text     "bank_account"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "account_id"
    t.integer  "category_id"
  end

  add_index "incomes", ["account_id"], name: "index_incomes_on_account_id"
  add_index "incomes", ["category_id"], name: "index_incomes_on_category_id"

end
