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

ActiveRecord::Schema.define(version: 20161107141535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "google_data", force: :cascade do |t|
    t.string   "account",                             null: false
    t.string   "campaign",                            null: false
    t.string   "ad_group",                            null: false
    t.string   "keyword",                             null: false
    t.string   "match_type"
    t.string   "device"
    t.string   "click_type"
    t.string   "date"
    t.string   "week"
    t.string   "month"
    t.integer  "impressions",             default: 0, null: false
    t.integer  "clicks",                  default: 0, null: false
    t.integer  "cost",                    default: 0, null: false
    t.integer  "conversions",             default: 0, null: false
    t.integer  "average_position"
    t.integer  "search_impression_share"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

end
