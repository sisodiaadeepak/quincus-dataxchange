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

ActiveRecord::Schema.define(version: 2019_01_28_101726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "addresses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organisation_id"
    t.string "raw_string"
    t.string "building_name"
    t.string "building_number"
    t.string "city_name"
    t.string "zipcode"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boxes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organisation_id"
    t.uuid "shipment_id"
    t.integer "mass"
    t.integer "height"
    t.integer "width"
    t.integer "depth"
    t.string "package_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deliveries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organisation_id"
    t.uuid "address_id"
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "priority"
    t.integer "timewindowstart"
    t.integer "timewindowend"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flat_shipments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organisation_id"
    t.uuid "job_id"
    t.uuid "vehicle_id"
    t.string "driverId"
    t.decimal "driverlat"
    t.decimal "driverlon"
    t.datetime "time_now"
    t.decimal "lat"
    t.decimal "lon"
    t.date "order_date"
    t.time "order_time"
    t.string "service_type"
    t.string "service_level"
    t.integer "volume"
    t.integer "weight"
    t.decimal "eta"
    t.decimal "old_eta"
    t.string "status"
    t.string "dispatch_code"
    t.string "shipper_line"
    t.string "pickup_address"
    t.decimal "pickup_latitude"
    t.decimal "pickup_longitude"
    t.time "pickup_start_time"
    t.time "pickup_commit_time"
    t.string "pickup_start_time_timezone"
    t.string "recipient_line"
    t.string "delivery_address"
    t.decimal "delivery_latitude"
    t.decimal "delivery_longitude"
    t.string "delivery_date"
    t.time "delivery_start_time"
    t.time "delivery_commit_time"
    t.string "delivery_start_time_timezone"
    t.integer "total_stops", default: 0
    t.integer "delivery_sequence_index", default: 0
    t.integer "stop_sequence", default: 0
    t.integer "section_number", default: 0
    t.integer "priority"
    t.integer "timewindowstart"
    t.integer "timewindowend"
    t.integer "number_of_packages", default: 0
    t.string "handling_id"
    t.decimal "handlingtime"
    t.float "actual_delivery_time"
    t.string "algo_arrival_time"
    t.string "algo_end_time"
    t.string "delivery_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "geocodes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organisation_id"
    t.string "geobatch_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "historical_algo_plans", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organisation_id"
    t.string "algo_id"
    t.uuid "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organisation_id"
    t.string "algo_id"
    t.integer "status", default: 0
    t.time "delivery_start_time"
    t.string "delivery_timezone_char", default: "UTC+00:00"
    t.date "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organisations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.time "default_delivery_start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickups", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organisation_id"
    t.uuid "address_id"
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "priority"
    t.integer "timewindowstart"
    t.integer "timewindowend"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shipments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "remote_id"
    t.uuid "organisation_id"
    t.uuid "job_id"
    t.uuid "vehicle_id"
    t.uuid "pickup_id"
    t.uuid "delivery_id"
    t.integer "weight"
    t.string "rawaddress"
    t.string "service_level"
    t.integer "number_of_packages", default: 1
    t.decimal "handlingtime"
    t.string "delivery_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "organisation_id"
    t.boolean "is_geoengine_user", default: false
    t.date "quota_reset_date"
    t.date "quota_last_accessed_date"
    t.integer "quota_usage_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "remote_id"
    t.uuid "organisation_id"
    t.uuid "job_id"
    t.decimal "latitude"
    t.decimal "longitude"
    t.integer "capacity"
    t.string "vehicle_type"
    t.boolean "is_active", default: true
    t.datetime "last_delivery_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
