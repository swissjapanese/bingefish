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

ActiveRecord::Schema.define(version: 20160710133542) do

  create_table "actors", force: :cascade do |t|
    t.integer  "show_id",     limit: 4,               null: false
    t.string   "name",        limit: 255
    t.string   "role",        limit: 255
    t.integer  "sort_order",  limit: 2,   default: 3, null: false
    t.string   "image",       limit: 255
    t.integer  "ImageAuthor", limit: 4
    t.datetime "ImageAdded"
  end

  add_index "actors", ["show_id"], name: "SeriesID", using: :btree

  create_table "aka_seriesname", force: :cascade do |t|
    t.integer  "seriesid",   limit: 4,   null: false
    t.string   "name",       limit: 255, null: false
    t.integer  "languageid", limit: 4,   null: false
    t.boolean  "search",                 null: false
    t.integer  "lasteditby", limit: 4,   null: false
    t.datetime "lastedit",               null: false
  end

  add_index "aka_seriesname", ["languageid"], name: "languageid", using: :btree
  add_index "aka_seriesname", ["name"], name: "name", type: :fulltext
  add_index "aka_seriesname", ["seriesid", "name", "languageid"], name: "seriesid_name_languageid", unique: true, using: :btree
  add_index "aka_seriesname", ["seriesid"], name: "seriesid", using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "keytype",      limit: 16,              null: false
    t.integer  "keyvalue",     limit: 4,               null: false
    t.integer  "userid",       limit: 4,   default: 1, null: false
    t.string   "subkey",       limit: 16
    t.string   "filename",     limit: 255,             null: false
    t.string   "username",     limit: 45
    t.integer  "dateadded",    limit: 4
    t.integer  "languageid",   limit: 4,   default: 7, null: false
    t.string   "resolution",   limit: 9
    t.string   "colors",       limit: 255
    t.string   "artistcolors", limit: 255
    t.datetime "mirrorupdate",                         null: false
  end

  add_index "banners", ["keyvalue"], name: "Index_3", using: :btree
  add_index "banners", ["mirrorupdate"], name: "mirrorupdate", using: :btree
  add_index "banners", ["subkey"], name: "subkey", using: :btree
  add_index "banners", ["userid"], name: "FK_banners_1", using: :btree

  create_table "countries", primary_key: "countryid", force: :cascade do |t|
    t.string "iso2",        limit: 2
    t.string "shortname",   limit: 80, default: "", null: false
    t.string "longname",    limit: 80, default: "", null: false
    t.string "iso3",        limit: 3
    t.string "numcode",     limit: 6
    t.string "un_member",   limit: 12
    t.string "callingcode", limit: 8
    t.string "tld",         limit: 5
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0, null: false
    t.integer  "attempts",   limit: 4,     default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "episodes", force: :cascade do |t|
    t.integer  "season_id",          limit: 4,                              default: 0,         null: false
    t.integer  "episode_number",     limit: 4,                              default: 0
    t.string   "episode_name",       limit: 255,                            default: "Unknown"
    t.string   "first_aired",        limit: 45
    t.text     "guest_stars",        limit: 65535
    t.text     "director",           limit: 65535
    t.text     "writer",             limit: 65535
    t.text     "overview",           limit: 65535
    t.string   "production_code",    limit: 45
    t.string   "show_url",           limit: 255
    t.integer  "lastupdated",        limit: 4
    t.integer  "flagged",            limit: 4,                              default: 0
    t.string   "DVD_discid",         limit: 45
    t.integer  "DVD_season",         limit: 4
    t.decimal  "DVD_episodenumber",                precision: 10, scale: 1
    t.integer  "DVD_chapter",        limit: 4
    t.string   "locked",             limit: 3,                              default: "no"
    t.integer  "absolute_number",    limit: 4
    t.string   "filename",           limit: 255
    t.integer  "show_id",            limit: 4,                                                  null: false
    t.integer  "lastupdatedby",      limit: 4,                              default: 0
    t.string   "airsafter_season",   limit: 10
    t.integer  "airsbefore_season",  limit: 4
    t.integer  "airsbefore_episode", limit: 4
    t.integer  "thumb_author",       limit: 4,                              default: 1
    t.datetime "thumb_added"
    t.integer  "thumb_width",        limit: 2
    t.integer  "thumb_height",       limit: 2
    t.integer  "tms_export",         limit: 8
    t.integer  "lockedby",           limit: 4
    t.string   "imdb_id",            limit: 25
    t.integer  "ep_img_flag",        limit: 1
    t.integer  "tms_review_by",      limit: 4
    t.date     "tms_review_date"
    t.boolean  "tms_review_blurry",                                         default: false
    t.boolean  "tms_review_dark",                                           default: false
    t.boolean  "tms_review_logo",                                           default: false
    t.boolean  "tms_review_other",                                          default: false
    t.boolean  "tms_review_unsure",                                         default: false
  end

  add_index "episodes", ["first_aired"], name: "FirstAired", using: :btree
  add_index "episodes", ["season_id"], name: "seasonid", using: :btree
  add_index "episodes", ["show_id"], name: "seriesid", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string "genre", limit: 100, null: false
  end

  create_table "jwt_tokens", force: :cascade do |t|
    t.text     "token",           limit: 65535
    t.date     "expiration_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "abbreviation", limit: 10,                 null: false
    t.string   "name",         limit: 50,                 null: false
    t.boolean  "enabled",                 default: false, null: false
    t.datetime "mirrorupdate",                            null: false
    t.string   "englishname",  limit: 50,                 null: false
  end

  add_index "languages", ["mirrorupdate"], name: "mirrorupdate", using: :btree

  create_table "languagesnew", primary_key: "ISO6393", force: :cascade do |t|
    t.string "ISO6392B",    limit: 3
    t.string "ISO6392T",    limit: 3
    t.string "ISO6391",     limit: 2
    t.string "Scope",       limit: 1
    t.string "Type",        limit: 1
    t.string "EnglishName", limit: 150
    t.string "NativeName",  limit: 250
  end

  create_table "networks", primary_key: "netID", force: :cascade do |t|
    t.string "Network",   limit: 40,  null: false
    t.string "Comment",   limit: 255
    t.string "Wikipedia", limit: 255
    t.string "Logo",      limit: 100
    t.string "ISO6393",   limit: 3
    t.string "ISO31661",  limit: 3
  end

  create_table "seasons", force: :cascade do |t|
    t.integer "show_id",       limit: 4,                 null: false
    t.integer "season",        limit: 4
    t.integer "bannerrequest", limit: 4, default: 0
    t.string  "locked",        limit: 3, default: "no"
    t.integer "lockedby",      limit: 4
    t.boolean "tms_wanted",              default: false
  end

  add_index "seasons", ["show_id", "season"], name: "uniqueseason", unique: true, using: :btree
  add_index "seasons", ["show_id"], name: "seriesid", using: :btree

  create_table "shows", force: :cascade do |t|
    t.string   "series_name",       limit: 255
    t.string   "series_id",         limit: 45
    t.string   "status",            limit: 100
    t.string   "first_aired",       limit: 100
    t.string   "network",           limit: 100
    t.integer  "NetworkID",         limit: 4
    t.string   "runtime",           limit: 100
    t.string   "genre",             limit: 100
    t.text     "actors",            limit: 65535
    t.text     "overview",          limit: 65535
    t.integer  "bannerrequest",     limit: 4,                             default: 0
    t.integer  "lastupdated",       limit: 4
    t.string   "airs_day_of_week",  limit: 45
    t.string   "airs_time",         limit: 45
    t.string   "rating",            limit: 45
    t.integer  "flagged",           limit: 4,                             default: 0
    t.integer  "forceupdate",       limit: 4,                             default: 0
    t.integer  "hits",              limit: 4,                             default: 0
    t.integer  "updateID",          limit: 4,                             default: 0
    t.string   "requestcomment",    limit: 255,                           default: ""
    t.string   "locked",            limit: 3,                             default: "no"
    t.integer  "lockedby",          limit: 4
    t.string   "autoimport",        limit: 16
    t.string   "disabled",          limit: 3,                             default: "No"
    t.string   "imdb_id",           limit: 25
    t.string   "zap2it_id",         limit: 12
    t.datetime "added"
    t.integer  "addedBy",           limit: 4
    t.boolean  "tms_wanted_old",                                          default: false
    t.integer  "tms_priority",      limit: 4,                             default: 0
    t.integer  "tms_wanted",        limit: 1
    t.integer  "popularity_rank",   limit: 4
    t.integer  "tvdb_id",           limit: 4
    t.decimal  "site_rating",                     precision: 5, scale: 2
    t.integer  "site_rating_count", limit: 4
    t.text     "fanart",            limit: 65535
  end

  add_index "shows", ["imdb_id"], name: "IMDB_ID", using: :btree
  add_index "shows", ["lastupdated"], name: "lastupdated", using: :btree
  add_index "shows", ["network"], name: "Network", using: :btree
  add_index "shows", ["series_name"], name: "SeriesName", type: :fulltext
  add_index "shows", ["tms_priority"], name: "tms_priority", using: :btree

  create_table "translation_episodename", force: :cascade do |t|
    t.integer  "episodeid",    limit: 4,   null: false
    t.integer  "languageid",   limit: 4,   null: false
    t.string   "translation",  limit: 255, null: false
    t.datetime "mirrorupdate",             null: false
  end

  add_index "translation_episodename", ["episodeid", "languageid"], name: "EpisodeId", using: :btree
  add_index "translation_episodename", ["mirrorupdate"], name: "mirrorupdate", using: :btree
  add_index "translation_episodename", ["translation"], name: "translation", type: :fulltext
  add_index "translation_episodename", ["translation"], name: "translationIndex", using: :btree

  create_table "translation_episodeoverview", force: :cascade do |t|
    t.integer  "episodeid",    limit: 4,     null: false
    t.integer  "languageid",   limit: 4,     null: false
    t.text     "translation",  limit: 65535
    t.datetime "mirrorupdate",               null: false
  end

  add_index "translation_episodeoverview", ["episodeid", "languageid"], name: "EpisodeId", using: :btree
  add_index "translation_episodeoverview", ["mirrorupdate"], name: "mirrorupdate", using: :btree

  create_table "translation_seriesname", force: :cascade do |t|
    t.integer  "seriesid",     limit: 4,   null: false
    t.integer  "languageid",   limit: 4,   null: false
    t.string   "translation",  limit: 255, null: false
    t.datetime "mirrorupdate",             null: false
  end

  add_index "translation_seriesname", ["mirrorupdate"], name: "mirrorupdate", using: :btree
  add_index "translation_seriesname", ["seriesid", "languageid"], name: "SeriesId", using: :btree
  add_index "translation_seriesname", ["translation"], name: "translation", type: :fulltext

  create_table "translation_seriesoverview", force: :cascade do |t|
    t.integer  "seriesid",     limit: 4,     null: false
    t.integer  "languageid",   limit: 4,     null: false
    t.text     "translation",  limit: 65535
    t.datetime "mirrorupdate",               null: false
  end

  add_index "translation_seriesoverview", ["mirrorupdate"], name: "mirrorupdate", using: :btree
  add_index "translation_seriesoverview", ["seriesid", "languageid"], name: "SeriesId", using: :btree

end
