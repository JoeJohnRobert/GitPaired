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

ActiveRecord::Schema.define(version: 20141204193541) do

  create_table "languages", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.boolean  "collaborator_wanted"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "archive_url"
    t.datetime "pushed_at"
    t.string   "language"
    t.integer  "watchers_count"
    t.string   "tags_url"
    t.string   "contributors_url"
    t.string   "collaborators_url"
  end

  create_table "tags", force: true do |t|
    t.string   "name"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "location"
    t.string   "image_path"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "uid"
    t.string   "gh_url"
    t.string   "gh_username"
    t.string   "repos_url"
    t.integer  "public_repos"
    t.integer  "following"
    t.integer  "followers"
    t.datetime "gh_created_at"
    t.datetime "blog_url"
  end

end
