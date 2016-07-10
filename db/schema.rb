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

ActiveRecord::Schema.define(version: 20160710013556) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "text"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree
  end

  create_table "jots", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_jots_on_user_id", using: :btree
  end

  create_table "listed_items", force: :cascade do |t|
    t.integer  "listable_id",               null: false
    t.string   "listable_type"
    t.integer  "list_id",                   null: false
    t.integer  "position",      default: 0
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["list_id"], name: "index_listed_items_on_list_id", using: :btree
    t.index ["listable_id"], name: "index_listed_items_on_listable_id", using: :btree
    t.index ["listable_type"], name: "index_listed_items_on_listable_type", using: :btree
  end

  create_table "lists", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "name"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stickered_items", force: :cascade do |t|
    t.string   "stickerable_type"
    t.integer  "stickerable_id"
    t.integer  "sticker_id",       null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["sticker_id"], name: "index_stickered_items_on_sticker_id", using: :btree
    t.index ["stickerable_type", "stickerable_id"], name: "index_stickered_items_on_stickerable_type_and_stickerable_id", using: :btree
  end

  create_table "stickers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "color"
    t.string   "shape"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "user_id",                    null: false
    t.string   "name",                       null: false
    t.boolean  "state",      default: false, null: false
    t.datetime "due_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_tasks_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
