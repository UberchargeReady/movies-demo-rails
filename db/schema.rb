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

ActiveRecord::Schema.define(version: 20161011183502) do

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_genres_on_name", unique: true
  end

  create_table "movie_genres", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_movie_genres_on_genre_id"
    t.index ["movie_id", "genre_id"], name: "index_movie_genres_on_movie_id_and_genre_id", unique: true
    t.index ["movie_id"], name: "index_movie_genres_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.datetime "released"
    t.string   "poster_url"
    t.integer  "runtime_in_mins"
    t.string   "director"
    t.string   "mpaa_rating"
    t.text     "plot"
    t.integer  "year"
    t.string   "writer"
    t.string   "actors"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "on_netflix"
    t.boolean  "on_amazon"
    t.boolean  "on_hulu"
    t.boolean  "on_google_play"
    t.boolean  "on_itunes"
    t.boolean  "on_hbo"
    t.boolean  "on_youtube"
    t.boolean  "on_vudu"
    t.boolean  "on_cinema_now"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin",          default: false
    t.string   "activation_digest"
    t.boolean  "is_activated",      default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "remember_digest"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
