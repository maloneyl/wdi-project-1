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

ActiveRecord::Schema.define(:version => 20131029142113) do

  create_table "music", :force => true do |t|
    t.string   "title"
    t.text     "track"
    t.string   "genre"
    t.text     "art"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "profiles", :force => true do |t|
    t.string   "font_face_primary"
    t.string   "font_face_secondary"
    t.string   "font_color_primary"
    t.string   "font_color_secondary"
    t.string   "link_color"
    t.text     "background_image"
    t.text     "avatar"
    t.text     "bio"
    t.string   "location"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "website"
    t.integer  "user_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "user_type"
    t.string   "handle"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
