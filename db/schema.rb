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

ActiveRecord::Schema.define(:version => 20140123000054) do

  create_table "followings", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "pet_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "followings", ["pet_id", "user_id"], :name => "index_followings_on_pet_id_and_user_id", :unique => true

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "ownerships", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "pet_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ownerships", ["pet_id", "user_id"], :name => "index_ownerships_on_pet_id_and_user_id", :unique => true

  create_table "pets", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "photo_url"
    t.string   "likes"
    t.string   "dislikes"
    t.string   "age"
    t.string   "gender"
    t.string   "breed"
    t.string   "size"
    t.string   "about"
    t.integer  "owner_id"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pets", ["slug"], :name => "index_pets_on_slug", :unique => true

  create_table "photos", :force => true do |t|
    t.integer  "user_id",     :null => false
    t.string   "photo_url",   :null => false
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "body"
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

  create_table "publicshares", :force => true do |t|
    t.integer  "post_id",         :null => false
    t.integer  "publicable_id",   :null => false
    t.string   "publicable_type", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "taggings", :force => true do |t|
    t.integer  "photo_id",   :null => false
    t.integer  "post_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "taggings", ["photo_id", "post_id"], :name => "index_taggings_on_photo_id_and_post_id", :unique => true

  create_table "testimonials", :force => true do |t|
    t.string   "body",       :null => false
    t.integer  "user_id",    :null => false
    t.integer  "pet_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "userdescriptions", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profession"
    t.string   "age"
    t.string   "about"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",                            :null => false
    t.string   "email"
    t.string   "password_digest",                     :null => false
    t.string   "session_token",                       :null => false
    t.string   "account_type",    :default => "user"
    t.string   "photo_url"
    t.string   "slug"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "users", ["session_token"], :name => "index_users_on_session_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
