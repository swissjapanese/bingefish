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

ActiveRecord::Schema.define(version: 20160511161134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

end
