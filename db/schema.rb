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

ActiveRecord::Schema.define(version: 2020_01_07_210309) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_comments_on_link_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_favorites_on_link_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "gyms", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "phone"
    t.string "email"
    t.string "affiliation"
    t.string "address_1"
    t.string "address_2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string "impressionable_type"
    t.integer "impressionable_id"
    t.integer "user_id"
    t.string "controller_name"
    t.string "action_name"
    t.string "view_name"
    t.string "request_hash"
    t.string "ip_address"
    t.string "session_hash"
    t.text "message"
    t.text "referrer"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index"
    t.index ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index"
    t.index ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index"
    t.index ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index"
    t.index ["impressionable_type", "impressionable_id", "params"], name: "poly_params_request_index"
    t.index ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index"
    t.index ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index"
    t.index ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "instagram"
    t.string "youtube"
    t.string "twitter"
    t.string "facebook"
    t.string "website"
  end

  create_table "instructors_links", id: false, force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "instructor_id", null: false
    t.index ["instructor_id", "link_id"], name: "index_instructors_links_on_instructor_id_and_link_id"
    t.index ["link_id", "instructor_id"], name: "index_instructors_links_on_link_id_and_instructor_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "location"
    t.integer "favorites_count", default: 0
    t.index ["url"], name: "index_links_on_url", unique: true
  end

  create_table "links_tags", id: false, force: :cascade do |t|
    t.bigint "link_id", null: false
    t.bigint "tag_id", null: false
    t.index ["link_id", "tag_id"], name: "index_links_tags_on_link_id_and_tag_id"
    t.index ["tag_id", "link_id"], name: "index_links_tags_on_tag_id_and_link_id"
  end

  create_table "login_activities", force: :cascade do |t|
    t.string "scope"
    t.string "strategy"
    t.string "identity"
    t.boolean "success"
    t.string "failure_reason"
    t.string "user_type"
    t.bigint "user_id"
    t.string "context"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "city"
    t.string "region"
    t.string "country"
    t.datetime "created_at"
    t.index ["identity"], name: "index_login_activities_on_identity"
    t.index ["ip"], name: "index_login_activities_on_ip"
    t.index ["user_type", "user_id"], name: "index_login_activities_on_user_type_and_user_id"
  end

  create_table "private_notes", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "user_id"
    t.bigint "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_private_notes_on_link_id"
    t.index ["user_id"], name: "index_private_notes_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "value", null: false
    t.bigint "user_id"
    t.bigint "link_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["link_id"], name: "index_ratings_on_link_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "stars"
    t.text "body"
    t.bigint "user_id"
    t.bigint "gym_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "home_gym", default: false
    t.text "languages", default: [], array: true
    t.text "tags", default: [], array: true
    t.integer "roll_type"
    t.index ["gym_id"], name: "index_reviews_on_gym_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "category"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
  end

  create_table "thumbnails", force: :cascade do |t|
    t.string "source"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "link_id"
    t.string "favicon"
    t.string "remote_image"
    t.index ["link_id"], name: "index_thumbnails_on_link_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "role"
    t.datetime "deleted_at"
    t.string "provider"
    t.string "uid"
    t.text "image"
    t.string "gender"
    t.integer "belt"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "links"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "links"
  add_foreign_key "favorites", "users"
  add_foreign_key "private_notes", "links"
  add_foreign_key "private_notes", "users"
  add_foreign_key "ratings", "links"
  add_foreign_key "ratings", "users"
  add_foreign_key "reviews", "gyms"
  add_foreign_key "reviews", "users"
  add_foreign_key "thumbnails", "links"
end
