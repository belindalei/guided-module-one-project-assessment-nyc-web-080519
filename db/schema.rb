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

ActiveRecord::Schema.define(version: 2019_08_19_173252) do

  create_table "job_queues", force: :cascade do |t|
    t.integer "open_job_id"
    t.integer "job_seeker_id"
  end

  create_table "job_seekers", force: :cascade do |t|
    t.string "name"
    t.integer "desired_salary"
    t.integer "level"
  end

  create_table "open_jobs", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "level"
    t.integer "salary_range_from"
    t.integer "salary_range_to"
  end

end
