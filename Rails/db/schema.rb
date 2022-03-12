# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_02_191802) do

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: 6, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "builds", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.integer "category", null: false, unsigned: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_builds_on_user_id"
  end

  create_table "builds_has_items", charset: "utf8mb4", force: :cascade do |t|
    t.integer "order", null: false, unsigned: true
    t.bigint "build_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["build_id"], name: "index_builds_has_items_on_build_id"
    t.index ["item_id"], name: "index_builds_has_items_on_item_id"
  end

  create_table "categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "champion_wishlists", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "champion_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["champion_id"], name: "index_champion_wishlists_on_champion_id"
    t.index ["user_id"], name: "index_champion_wishlists_on_user_id"
  end

  create_table "champions", charset: "utf8mb4", force: :cascade do |t|
    t.integer "price", null: false, unsigned: true
    t.string "name", null: false
    t.integer "position", null: false, unsigned: true
    t.string "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friends", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "ask_id", null: false
    t.bigint "receive_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ask_id"], name: "index_friends_on_ask_id"
    t.index ["receive_id"], name: "index_friends_on_receive_id"
  end

  create_table "friends_has_plannings", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "planning_id", null: false
    t.bigint "friend_id", null: false
    t.datetime "accepted_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend_id"], name: "index_friends_has_plannings_on_friend_id"
    t.index ["planning_id"], name: "index_friends_has_plannings_on_planning_id"
  end

  create_table "items", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "price", null: false, unsigned: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "match_histories", charset: "utf8mb4", force: :cascade do |t|
    t.integer "position", null: false, unsigned: true
    t.boolean "victory", null: false
    t.bigint "champion_id", null: false
    t.bigint "user_id", null: false
    t.bigint "build_id", null: false
    t.bigint "rune_page_id", null: false
    t.integer "last_item", null: false, unsigned: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["build_id"], name: "index_match_histories_on_build_id"
    t.index ["champion_id"], name: "index_match_histories_on_champion_id"
    t.index ["rune_page_id"], name: "index_match_histories_on_rune_page_id"
    t.index ["user_id"], name: "index_match_histories_on_user_id"
  end

  create_table "plannings", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "creator_id", null: false
    t.datetime "date", precision: 6, null: false
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_plannings_on_creator_id"
  end

  create_table "rune_pages", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_rune_pages_on_user_id"
  end

  create_table "runes", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "level", null: false, unsigned: true
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_runes_on_category_id"
  end

  create_table "runes_has_runes_pages", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "rune_id", null: false
    t.bigint "rune_page_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rune_id"], name: "index_runes_has_runes_pages_on_rune_id"
    t.index ["rune_page_id"], name: "index_runes_has_runes_pages_on_rune_page_id"
  end

  create_table "skin_wishlists", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "skin_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["skin_id"], name: "index_skin_wishlists_on_skin_id"
    t.index ["user_id"], name: "index_skin_wishlists_on_user_id"
  end

  create_table "skins", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "champion_id", null: false
    t.integer "price", null: false, unsigned: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["champion_id"], name: "index_skins_on_champion_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.boolean "isAdmin"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "builds", "users"
  add_foreign_key "builds_has_items", "builds"
  add_foreign_key "builds_has_items", "items"
  add_foreign_key "champion_wishlists", "champions"
  add_foreign_key "champion_wishlists", "users"
  add_foreign_key "friends", "users", column: "ask_id"
  add_foreign_key "friends", "users", column: "receive_id"
  add_foreign_key "friends_has_plannings", "plannings"
  add_foreign_key "friends_has_plannings", "users", column: "friend_id"
  add_foreign_key "match_histories", "builds"
  add_foreign_key "match_histories", "champions"
  add_foreign_key "match_histories", "rune_pages"
  add_foreign_key "match_histories", "users"
  add_foreign_key "plannings", "users", column: "creator_id"
  add_foreign_key "rune_pages", "users"
  add_foreign_key "runes", "categories"
  add_foreign_key "runes_has_runes_pages", "rune_pages"
  add_foreign_key "runes_has_runes_pages", "runes"
  add_foreign_key "skin_wishlists", "skins"
  add_foreign_key "skin_wishlists", "users"
  add_foreign_key "skins", "champions"
end
