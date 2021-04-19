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

ActiveRecord::Schema.define(version: 2019_08_07_044257) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.integer "user_id"
    t.string "token"
    t.string "secret"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
    t.index ["user_id"], name: "index_categories_on_user_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "galleries", force: :cascade do |t|
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_galleries_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "rate", precision: 19, scale: 2
    t.decimal "quantity", precision: 19, scale: 2
    t.string "per"
    t.bigint "user_id"
    t.bigint "category_id"
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["slug"], name: "index_items_on_slug", unique: true
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["exp"], name: "index_jwt_blacklists_on_exp"
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "oauth_access_grants", force: :cascade do |t|
    t.bigint "resource_owner_id", null: false
    t.bigint "application_id", null: false
    t.string "token", null: false
    t.integer "expires_in", null: false
    t.text "redirect_uri", null: false
    t.datetime "created_at", null: false
    t.datetime "revoked_at"
    t.string "scopes"
    t.index ["application_id"], name: "index_oauth_access_grants_on_application_id"
    t.index ["resource_owner_id"], name: "index_oauth_access_grants_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_grants_on_token", unique: true
  end

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.bigint "resource_owner_id"
    t.bigint "application_id"
    t.string "token", null: false
    t.string "refresh_token"
    t.integer "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at", null: false
    t.string "scopes"
    t.string "previous_refresh_token", default: "", null: false
    t.index ["application_id"], name: "index_oauth_access_tokens_on_application_id"
    t.index ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true
    t.index ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id"
    t.index ["token"], name: "index_oauth_access_tokens_on_token", unique: true
  end

  create_table "oauth_applications", force: :cascade do |t|
    t.string "name", null: false
    t.string "uid", null: false
    t.string "secret", null: false
    t.text "redirect_uri", null: false
    t.string "scopes", default: "", null: false
    t.boolean "confidential", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uid"], name: "index_oauth_applications_on_uid", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.decimal "tax", precision: 4, scale: 2
    t.string "currency", limit: 3
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "name"
    t.text "information"
    t.decimal "rate", precision: 19, scale: 2
    t.decimal "tax", precision: 19, scale: 2
    t.decimal "no_discount_price", precision: 19, scale: 2
    t.decimal "discount_price", precision: 19, scale: 2
    t.decimal "price", precision: 19, scale: 2
    t.decimal "pay", precision: 19, scale: 2
    t.decimal "return", precision: 19, scale: 2
    t.decimal "refund", precision: 19, scale: 2
    t.bigint "user_id"
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "transitems", force: :cascade do |t|
    t.bigint "transaction_id"
    t.bigint "item_id"
    t.string "name"
    t.integer "quantity"
    t.decimal "actual_rate", precision: 19, scale: 2
    t.decimal "rate", precision: 19, scale: 2
    t.decimal "discount", precision: 2, scale: 2
    t.decimal "tax", precision: 19, scale: 2
    t.decimal "no_discount_price", precision: 19, scale: 2
    t.decimal "discount_price", precision: 19, scale: 2
    t.decimal "price", precision: 19, scale: 2
    t.decimal "price_with_tax", precision: 19, scale: 2
    t.string "per"
    t.bigint "user_id"
    t.boolean "deleted", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_transitems_on_item_id"
    t.index ["transaction_id"], name: "index_transitems_on_transaction_id"
    t.index ["user_id"], name: "index_transitems_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "about"
    t.string "image"
    t.string "location"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: ""
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "authentication_token"
    t.integer "mode", default: 0, null: false
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "users"
  add_foreign_key "galleries", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
  add_foreign_key "oauth_access_grants", "oauth_applications", column: "application_id"
  add_foreign_key "oauth_access_tokens", "oauth_applications", column: "application_id"
  add_foreign_key "settings", "users"
  add_foreign_key "transactions", "users"
  add_foreign_key "transitems", "items"
  add_foreign_key "transitems", "transactions"
  add_foreign_key "transitems", "users"
end
