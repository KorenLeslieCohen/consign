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

ActiveRecord::Schema.define(version: 20141218112745) do

  create_table "biztags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "boroughs", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_biztags", force: true do |t|
    t.integer  "business_id"
    t.integer  "biztag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "business_designers", force: true do |t|
    t.integer  "business_id"
    t.integer  "designer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", force: true do |t|
    t.integer  "user_id"
    t.integer  "neighborhood_id"
    t.integer  "borough_id"
    t.string   "name"
    t.text     "address"
    t.text     "hours"
    t.string   "email"
    t.text     "terms"
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.string   "phone"
    t.text     "map"
  end

  create_table "designers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "neighborhoods", force: true do |t|
    t.string   "name"
    t.integer  "borough_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photo_tags", force: true do |t|
    t.integer  "photo_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.integer  "business_id"
    t.integer  "user_id"
    t.string   "business_photo_file_name"
    t.string   "business_photo_content_type"
    t.integer  "business_photo_file_size"
    t.datetime "business_photo_updated_at"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "business_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                           default: "", null: false
    t.string   "encrypted_password",              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "role"
    t.string   "user_name"
    t.string   "name"
    t.string   "user_profile_photo_file_name"
    t.string   "user_profile_photo_content_type"
    t.integer  "user_profile_photo_file_size"
    t.datetime "user_profile_photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
