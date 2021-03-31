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

ActiveRecord::Schema.define(version: 2021_03_30_224342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string "title", null: false
    t.string "subtitle"
    t.string "state", default: "draft", null: false
    t.text "body", null: false
    t.string "publisher"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.index ["published_at"], name: "blog_posts_published_at_idx"
    t.index ["slug"], name: "index_blog_posts_on_slug", unique: true
    t.index ["state"], name: "blog_posts_state_idx"
    t.index ["title"], name: "blog_posts_title_idx"
  end

  create_table "broadcasts", force: :cascade do |t|
    t.integer "admin_user_id"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "children", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "birthday"
    t.string "sex"
    t.string "location"
    t.text "allergies_notes"
    t.text "notes"
    t.integer "parent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.integer "item_type"
    t.string "ingredients"
    t.string "description"
    t.integer "menu_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_items_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "conversation_id"
    t.bigint "parent_id"
    t.boolean "read", default: false
    t.boolean "comfirmed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["parent_id"], name: "index_messages_on_parent_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_primary"
    t.string "phone_secondary"
    t.boolean "primary_contract"
    t.string "street"
    t.string "province"
    t.string "postal"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "state", default: "draft", null: false
    t.text "body"
    t.string "location"
    t.string "reviewer"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["published_at"], name: "reviews_published_at_idx"
    t.index ["state"], name: "reviews_state_idx"
  end

  create_table "staff_pages", force: :cascade do |t|
    t.string "name"
    t.text "body"
    t.string "location"
    t.string "state", default: "draft", null: false
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.index ["published_at"], name: "staff_pages_published_at_idx"
    t.index ["slug"], name: "index_staff_pages_on_slug", unique: true
    t.index ["state"], name: "staff_pages_state_idx"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "children", "parents"
  add_foreign_key "items", "menus"
end
