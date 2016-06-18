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

ActiveRecord::Schema.define(version: 20160618135540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attribute_kinds", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind_id"
    t.integer  "attribute_meta", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["kind_id"], name: "index_attribute_kinds_on_kind_id", using: :btree
  end

  create_table "attribute_values", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "attribute_kind_id"
    t.integer  "possible_value_id"
    t.text     "value"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["attribute_kind_id"], name: "index_attribute_values_on_attribute_kind_id", using: :btree
    t.index ["item_id"], name: "index_attribute_values_on_item_id", using: :btree
    t.index ["possible_value_id"], name: "index_attribute_values_on_possible_value_id", using: :btree
  end

  create_table "identities", force: :cascade do |t|
    t.string   "provider"
    t.string   "name"
    t.float    "rating"
    t.float    "cost"
    t.jsonb    "classification", default: {}, null: false
    t.jsonb    "location",       default: {}, null: false
    t.jsonb    "info",           default: {}, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "items", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "image"
    t.integer  "meeting_id"
    t.integer  "kind_id"
    t.integer  "identity_id"
    t.index ["identity_id"], name: "index_items_on_identity_id", using: :btree
    t.index ["kind_id"], name: "index_items_on_kind_id", using: :btree
    t.index ["meeting_id"], name: "index_items_on_meeting_id", using: :btree
  end

  create_table "kinds", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "subject",                 null: false
    t.text     "text"
    t.string   "emails",     default: [], null: false, array: true
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "possible_values", force: :cascade do |t|
    t.string   "value"
    t.integer  "attribute_kind_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["attribute_kind_id"], name: "index_possible_values_on_attribute_kind_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.float    "value"
    t.text     "comment"
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_ratings_on_item_id", using: :btree
    t.index ["user_id"], name: "index_ratings_on_user_id", using: :btree
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.string   "name"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "attribute_kinds", "kinds"
  add_foreign_key "attribute_values", "attribute_kinds"
  add_foreign_key "attribute_values", "items"
  add_foreign_key "attribute_values", "possible_values"
  add_foreign_key "items", "identities"
  add_foreign_key "items", "kinds"
  add_foreign_key "items", "meetings"
  add_foreign_key "possible_values", "attribute_kinds"
  add_foreign_key "ratings", "items"
  add_foreign_key "ratings", "users"
end
