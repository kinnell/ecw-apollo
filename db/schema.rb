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

ActiveRecord::Schema.define(version: 20141204210756) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "assignments", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["project_id", "user_id"], name: "index_assignments_on_project_id_and_user_id"
  add_index "assignments", ["project_id"], name: "index_assignments_on_project_id"
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id"

  create_table "comments", force: true do |t|
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "user_id"
  end

  add_index "comments", ["project_id"], name: "index_comments_on_project_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "items", force: true do |t|
    t.string   "name",       default: "",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.string   "status",     default: "In Queue", null: false
    t.string   "item_type"
    t.integer  "created_by"
  end

  add_index "items", ["project_id"], name: "index_items_on_project_id"

  create_table "notes", force: true do |t|
    t.text     "content"
    t.integer  "noteable_id"
    t.string   "noteable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by"
  end

  add_index "notes", ["noteable_id", "noteable_type"], name: "index_notes_on_noteable_id_and_noteable_type"

  create_table "print_jobs", force: true do |t|
    t.integer  "project_id"
    t.string   "number"
    t.string   "name"
    t.string   "account"
    t.string   "printer"
    t.integer  "quantity"
    t.decimal  "rate"
    t.decimal  "total_quote"
    t.decimal  "rewards_percentage"
    t.decimal  "total_paid"
    t.datetime "date_paid"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "name",       default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "due_date"
    t.string   "status",                  default: "In Queue", null: false
    t.text     "description", limit: 255
    t.integer  "product_id"
    t.datetime "end_date"
    t.string   "assigned_by"
    t.boolean  "starred",                 default: false,      null: false
    t.integer  "created_by"
  end

  add_index "projects", ["product_id"], name: "index_projects_on_product_id"

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.datetime "due_date"
    t.boolean  "completed",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "completed_at"
    t.integer  "user_id",                      null: false
    t.boolean  "starred",      default: false, null: false
    t.integer  "project_id"
    t.integer  "item_id"
    t.integer  "created_by"
  end

  add_index "tasks", ["item_id"], name: "index_tasks_on_item_id"
  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                      default: "",    null: false
    t.string   "encrypted_password",         default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name"
    t.boolean  "admin",                      default: false, null: false
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
