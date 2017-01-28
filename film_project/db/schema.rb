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

ActiveRecord::Schema.define(version: 20170128102418) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "name",            limit: 65535
    t.text     "email",           limit: 65535
    t.text     "password_digest", limit: 65535
    t.text     "salt",            limit: 65535, null: false
    t.text     "firstname",       limit: 65535, null: false
    t.text     "secondname",      limit: 65535, null: false
    t.text     "address",         limit: 65535, null: false
    t.text     "postcode",        limit: 65535, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "buy_films", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "filmtitle",   limit: 65535
    t.text     "filmprice",   limit: 65535
    t.text     "paymenttype", limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "buy_games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "gametitle",   limit: 65535
    t.text     "gameprice",   limit: 65535
    t.text     "platform",    limit: 65535
    t.text     "paymenttype", limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "buys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "filmtitle",   limit: 65535
    t.text     "filmprice",   limit: 65535
    t.text     "paymenttype", limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "films", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "filmtitle"
    t.string   "filmdescription"
    t.string   "filmdirector"
    t.string   "filmrating"
    t.string   "filmstarname"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "games", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "gametitle",       limit: 65535
    t.text     "gameDescription", limit: 65535
    t.text     "gamerating",      limit: 65535
    t.text     "gamegenre",       limit: 65535
    t.text     "platform",        limit: 65535, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "rentals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "filmtitle"
    t.text     "filmduration", limit: 65535
    t.text     "rentalstatus", limit: 65535
    t.integer  "user_id"
    t.text     "username",     limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text     "commenter",  limit: 65535
    t.text     "body",       limit: 65535
    t.text     "rating",     limit: 65535
    t.integer  "film_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["film_id"], name: "index_reviews_on_film_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.text     "salt",            limit: 65535, null: false
    t.text     "firstname",       limit: 65535, null: false
    t.text     "secondname",      limit: 65535, null: false
    t.text     "address",         limit: 65535, null: false
    t.text     "postcode",        limit: 65535, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_foreign_key "reviews", "films"
end
