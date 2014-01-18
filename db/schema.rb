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

ActiveRecord::Schema.define(:version => 20140115194149) do

  create_table "followings", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "pet_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "followings", ["pet_id", "user_id"], :name => "index_followings_on_pet_id_and_user_id", :unique => true

  create_table "pets", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "photo_url"
    t.string   "likes"
    t.string   "dislikes"
    t.string   "age"
    t.string   "gender"
    t.string   "size"
    t.string   "about"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "body"
    t.string   "photo_url"
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "postshares", :force => true do |t|
    t.integer  "post_id",                          :null => false
    t.integer  "postable_id",                      :null => false
    t.string   "postable_type",                    :null => false
    t.boolean  "show",          :default => false
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "testimonials", :force => true do |t|
    t.string   "body",       :null => false
    t.integer  "user_id",    :null => false
    t.integer  "pet_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "userdescriptions", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "profession"
    t.string   "age"
    t.string   "about"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                            :null => false
    t.string   "password_digest",                     :null => false
    t.string   "session_token",                       :null => false
    t.string   "account_type",    :default => "user"
    t.string   "photo_url"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
