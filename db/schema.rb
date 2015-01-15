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

ActiveRecord::Schema.define(version: 20150115075957) do

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
    t.text     "street_address"
    t.string   "email"
    t.string   "profile_photo_file_name"
    t.string   "profile_photo_content_type"
    t.integer  "profile_photo_file_size"
    t.datetime "profile_photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.string   "phone"
    t.text     "map"
    t.string   "admin_email"
    t.text     "percent_to_client"
    t.text     "markdown_info"
    t.text     "consignment_period"
    t.text     "return_policy"
    t.text     "appointment_info"
    t.text     "special_offers"
    t.string   "ecommerce_site"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "sunday_opening"
    t.string   "sunday_closing"
    t.string   "monday_opening"
    t.string   "monday_closing"
    t.string   "tuesday_opening"
    t.string   "tuesday_closing"
    t.string   "wednesday_opening"
    t.string   "wednesday_closing"
    t.string   "thursday_opening"
    t.string   "thursday_closing"
    t.string   "friday_opening"
    t.string   "friday_closing"
    t.string   "saturday_opening"
    t.string   "saturday_closing"
    t.text     "return_of_consigned_goods"
    t.string   "pickup_available"
    t.text     "restrictions"
    t.text     "additional_info"
    t.text     "store_bio"
    t.string   "authenticity"
    t.text     "shop_additional_info"
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
    t.string   "last_name"
    t.string   "first_name"
    t.string   "user_profile_photo_file_name"
    t.string   "user_profile_photo_content_type"
    t.integer  "user_profile_photo_file_size"
    t.datetime "user_profile_photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
    t.string   "url"
    t.string   "tagline"
    t.string   "city"
    t.string   "state"
    t.string   "age"
    t.string   "gender"
    t.string   "agree_to_terms"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
