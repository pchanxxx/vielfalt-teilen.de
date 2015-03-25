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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130625105348) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "slogan"
    t.text     "introtext"
    t.string   "color_top"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "menu_graphic_file_name"
    t.string   "menu_graphic_content_type"
    t.integer  "menu_graphic_file_size"
    t.datetime "menu_graphic_updated_at"
    t.string   "header_image_file_name"
    t.string   "header_image_content_type"
    t.integer  "header_image_file_size"
    t.datetime "header_image_updated_at"
    t.integer  "sort_order"
    t.string   "color_bottom"
    t.text     "simpletext"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.datetime "date_start"
    t.datetime "date_end"
    t.string   "location"
    t.text     "description"
    t.datetime "published_at"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "all_day_start"
    t.boolean  "all_day_end"
  end

  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "intro"
    t.text     "full_text"
    t.text     "simple_text"
    t.integer  "status"
    t.datetime "published_at"
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "teaser_image_file_name"
    t.string   "teaser_image_content_type"
    t.integer  "teaser_image_file_size"
    t.datetime "teaser_image_updated_at"
    t.string   "intro_audio_url"
    t.string   "full_audio_url"
    t.string   "simple_audio_url"
  end

  add_index "posts", ["category_id"], :name => "index_posts_on_category_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "static_images", :force => true do |t|
    t.string   "static_image"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

  create_table "zeichens", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "picture"
    t.string   "text"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "published",  :default => false
  end

end
