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

ActiveRecord::Schema.define(version: 20160524215711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.text     "first_name"
    t.text     "middle_name"
    t.text     "last_name"
    t.text     "photo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "casts", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "episodes", force: :cascade do |t|
    t.integer  "show_id"
    t.integer  "season_id"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jwt_tokens", force: :cascade do |t|
    t.text     "token"
    t.date     "expiration_date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "seasons", force: :cascade do |t|
    t.integer  "show_id"
    t.integer  "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "show_images", force: :cascade do |t|
    t.text     "image_type"
    t.text     "image"
    t.integer  "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shows", force: :cascade do |t|
    t.text     "imdb_id"
    t.text     "title"
    t.integer  "year"
    t.text     "rating"
    t.text     "runtime"
    t.text     "genre"
    t.text     "release"
    t.text     "director"
    t.text     "writer"
    t.text     "cast"
    t.text     "metacritic"
    t.text     "imdb_rating"
    t.text     "imdb_votes"
    t.text     "poster"
    t.text     "plot"
    t.text     "full_plot"
    t.text     "language"
    t.text     "country"
    t.text     "awards"
    t.text     "last_updated"
    t.text     "show_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "season"
    t.text     "episode"
    t.text     "series_id"
    t.integer  "tvdb_id"
  end

end
