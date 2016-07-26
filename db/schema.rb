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

ActiveRecord::Schema.define(version: 20160726190112) do

  create_table "actors", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer  "show_id",                           null: false
    t.string   "name"
    t.string   "role"
    t.integer  "sort_order",  limit: 2, default: 3, null: false
    t.string   "image"
    t.integer  "ImageAuthor"
    t.datetime "ImageAdded"
    t.index ["show_id"], name: "SeriesID", using: :btree
  end

  create_table "aka_seriesname", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer  "seriesid",   null: false
    t.string   "name",       null: false
    t.integer  "languageid", null: false
    t.boolean  "search",     null: false, comment: "Indicates if it's a true alias or just an alias meant to make it easier to find in a search"
    t.integer  "lasteditby", null: false
    t.datetime "lastedit",   null: false
    t.index ["languageid"], name: "languageid", using: :btree
    t.index ["name"], name: "name", type: :fulltext
    t.index ["seriesid", "name", "languageid"], name: "seriesid_name_languageid", unique: true, using: :btree
    t.index ["seriesid"], name: "seriesid", using: :btree
  end

  create_table "banners", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC" do |t|
    t.string   "keytype",      limit: 16,                                      null: false
    t.integer  "keyvalue",                                                     null: false, unsigned: true
    t.integer  "userid",                  default: 1,                          null: false, unsigned: true
    t.string   "subkey",       limit: 16
    t.string   "filename",                                                     null: false
    t.string   "username",     limit: 45
    t.integer  "dateadded",                                                                 unsigned: true
    t.integer  "languageid",              default: 7,                          null: false
    t.string   "resolution",   limit: 9
    t.string   "colors"
    t.string   "artistcolors"
    t.datetime "mirrorupdate",            default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["keyvalue"], name: "Index_3", using: :btree
    t.index ["mirrorupdate"], name: "mirrorupdate", using: :btree
    t.index ["subkey"], name: "subkey", using: :btree
    t.index ["userid"], name: "FK_banners_1", using: :btree
  end

  create_table "countries", primary_key: "countryid", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "iso2",        limit: 2,                            collation: "latin1_swedish_ci"
    t.string "shortname",   limit: 80, default: "", null: false, collation: "latin1_swedish_ci"
    t.string "longname",    limit: 80, default: "", null: false, collation: "latin1_swedish_ci"
    t.string "iso3",        limit: 3,                            collation: "latin1_swedish_ci"
    t.string "numcode",     limit: 6,                            collation: "latin1_swedish_ci"
    t.string "un_member",   limit: 12,                           collation: "latin1_swedish_ci"
    t.string "callingcode", limit: 8,                            collation: "latin1_swedish_ci"
    t.string "tld",         limit: 5,                            collation: "latin1_swedish_ci"
  end

  create_table "delayed_jobs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "priority",                 default: 0, null: false
    t.integer  "attempts",                 default: 0, null: false
    t.text     "handler",    limit: 65535,             null: false
    t.text     "last_error", limit: 65535
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "episodes", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "InnoDB free: 5120 kB; (`seasonid`) REFER `tvshows/tvseasons`" do |t|
    t.integer  "season_id",                                                 default: 0,         null: false, unsigned: true
    t.integer  "episode_number",                                            default: 0,                      unsigned: true
    t.string   "episode_name",                                              default: "Unknown"
    t.string   "first_aired",        limit: 45
    t.text     "guest_stars",        limit: 65535
    t.text     "director",           limit: 65535
    t.text     "writer",             limit: 65535
    t.text     "overview",           limit: 65535
    t.string   "production_code",    limit: 45
    t.string   "show_url"
    t.integer  "lastupdated",                                                                                unsigned: true
    t.integer  "flagged",                                                   default: 0,                      unsigned: true
    t.string   "DVD_discid",         limit: 45
    t.integer  "DVD_season",                                                                                 unsigned: true
    t.decimal  "DVD_episodenumber",                precision: 10, scale: 1,                                  unsigned: true
    t.integer  "DVD_chapter",                                                                                unsigned: true
    t.string   "locked",             limit: 3,                              default: "no"
    t.integer  "absolute_number"
    t.string   "filename"
    t.integer  "show_id",                                                                       null: false, unsigned: true
    t.integer  "lastupdatedby",                                             default: 0,                      unsigned: true
    t.string   "airsafter_season",   limit: 10
    t.integer  "airsbefore_season"
    t.integer  "airsbefore_episode"
    t.integer  "thumb_author",                                              default: 1
    t.datetime "thumb_added"
    t.integer  "thumb_width",        limit: 2,                                                               unsigned: true
    t.integer  "thumb_height",       limit: 2,                                                               unsigned: true
    t.bigint   "tms_export"
    t.integer  "lockedby"
    t.string   "imdb_id",            limit: 25
    t.integer  "ep_img_flag",        limit: 1
    t.integer  "tms_review_by"
    t.date     "tms_review_date"
    t.boolean  "tms_review_blurry",                                         default: false
    t.boolean  "tms_review_dark",                                           default: false
    t.boolean  "tms_review_logo",                                           default: false
    t.boolean  "tms_review_other",                                          default: false
    t.boolean  "tms_review_unsure",                                         default: false
    t.index ["first_aired"], name: "FirstAired", using: :btree
    t.index ["season_id"], name: "seasonid", using: :btree
    t.index ["show_id"], name: "seriesid", using: :btree
  end

  create_table "genres", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "genre", limit: 100, null: false
  end

  create_table "jwt_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "token",           limit: 65535
    t.date     "expiration_date"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "languages", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "abbreviation", limit: 10,                                      null: false
    t.string   "name",         limit: 50,                                      null: false, collation: "utf8_unicode_ci"
    t.boolean  "enabled",                 default: false,                      null: false
    t.datetime "mirrorupdate",            default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "englishname",  limit: 50,                                      null: false
    t.index ["mirrorupdate"], name: "mirrorupdate", using: :btree
  end

  create_table "languagesnew", primary_key: "ISO6393", id: :string, limit: 3, default: "", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "ISO6392B",    limit: 3
    t.string "ISO6392T",    limit: 3
    t.string "ISO6391",     limit: 2
    t.string "Scope",       limit: 1
    t.string "Type",        limit: 1
    t.string "EnglishName", limit: 150
    t.string "NativeName",  limit: 250
  end

  create_table "networks", primary_key: "netID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "Network",   limit: 40,  null: false
    t.string "Comment"
    t.string "Wikipedia"
    t.string "Logo",      limit: 100
    t.string "ISO6393",   limit: 3,                comment: "Links to languagesnew table on field of the same name "
    t.string "ISO31661",  limit: 3,                comment: "Links to countries table on ISO3 field"
  end

  create_table "seasons", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC" do |t|
    t.integer "show_id",                                 null: false, unsigned: true
    t.integer "season",                                               unsigned: true
    t.integer "bannerrequest",           default: 0,                  unsigned: true
    t.string  "locked",        limit: 3, default: "no"
    t.integer "lockedby"
    t.boolean "tms_wanted",              default: false
    t.index ["show_id", "season"], name: "uniqueseason", unique: true, using: :btree
    t.index ["show_id"], name: "seriesid", using: :btree
  end

  create_table "shows", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC" do |t|
    t.string   "series_name"
    t.string   "series_id",         limit: 45
    t.string   "status",            limit: 100
    t.string   "first_aired",       limit: 100
    t.string   "network",           limit: 100
    t.integer  "NetworkID",                                                               unsigned: true
    t.string   "runtime",           limit: 100
    t.string   "genre",             limit: 100
    t.text     "actors",            limit: 65535
    t.text     "overview",          limit: 65535
    t.integer  "bannerrequest",                                           default: 0,     unsigned: true
    t.integer  "lastupdated",                                                             unsigned: true
    t.string   "airs_day_of_week",  limit: 45
    t.string   "airs_time",         limit: 45
    t.string   "rating",            limit: 45
    t.integer  "flagged",                                                 default: 0,     unsigned: true
    t.integer  "forceupdate",                                             default: 0,     unsigned: true
    t.integer  "hits",                                                    default: 0,     unsigned: true
    t.integer  "updateID",                                                default: 0
    t.string   "requestcomment",                                          default: ""
    t.string   "locked",            limit: 3,                             default: "no"
    t.integer  "lockedby"
    t.string   "autoimport",        limit: 16
    t.string   "disabled",          limit: 3,                             default: "No"
    t.string   "imdb_id",           limit: 25
    t.string   "zap2it_id",         limit: 12
    t.datetime "added"
    t.integer  "addedBy"
    t.boolean  "tms_wanted_old",                                          default: false
    t.integer  "tms_priority",                                            default: 0
    t.integer  "tms_wanted",        limit: 1
    t.integer  "popularity_rank"
    t.integer  "tvdb_id"
    t.decimal  "site_rating",                     precision: 5, scale: 2
    t.integer  "site_rating_count"
    t.text     "fanart",            limit: 65535
    t.text     "poster",            limit: 65535
    t.text     "banner",            limit: 65535
    t.text     "clearart",          limit: 65535
    t.text     "logo",              limit: 65535
    t.index ["imdb_id"], name: "IMDB_ID", using: :btree
    t.index ["lastupdated"], name: "lastupdated", using: :btree
    t.index ["network"], name: "Network", using: :btree
    t.index ["series_name"], name: "SeriesName", type: :fulltext
    t.index ["tms_priority"], name: "tms_priority", using: :btree
  end

  create_table "translation_episodename", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer  "episodeid",                                         null: false, unsigned: true
    t.integer  "languageid",                                        null: false, unsigned: true
    t.string   "translation",                                       null: false
    t.datetime "mirrorupdate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["episodeid", "languageid"], name: "EpisodeId", using: :btree
    t.index ["mirrorupdate"], name: "mirrorupdate", using: :btree
    t.index ["translation"], name: "translation", type: :fulltext
    t.index ["translation"], name: "translationIndex", using: :btree
  end

  create_table "translation_episodeoverview", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC" do |t|
    t.integer  "episodeid",                                                       null: false, unsigned: true
    t.integer  "languageid",                                                      null: false, unsigned: true
    t.text     "translation",  limit: 65535
    t.datetime "mirrorupdate",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["episodeid", "languageid"], name: "EpisodeId", using: :btree
    t.index ["mirrorupdate"], name: "mirrorupdate", using: :btree
  end

  create_table "translation_seriesname", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC" do |t|
    t.integer  "seriesid",                                          null: false, unsigned: true
    t.integer  "languageid",                                        null: false, unsigned: true
    t.string   "translation",                                       null: false
    t.datetime "mirrorupdate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["mirrorupdate"], name: "mirrorupdate", using: :btree
    t.index ["seriesid", "languageid"], name: "SeriesId", using: :btree
    t.index ["translation"], name: "translation", type: :fulltext
  end

  create_table "translation_seriesoverview", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer  "seriesid",                                                        null: false, unsigned: true
    t.integer  "languageid",                                                      null: false, unsigned: true
    t.text     "translation",  limit: 65535
    t.datetime "mirrorupdate",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["mirrorupdate"], name: "mirrorupdate", using: :btree
    t.index ["seriesid", "languageid"], name: "SeriesId", using: :btree
  end

end
