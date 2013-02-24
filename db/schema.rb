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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130224172327) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "escalations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "follow_junctions", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "report_followed_id"
    t.datetime "last_viewed"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "positions", :force => true do |t|
    t.string   "name"
    t.boolean  "admin_permisions"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "priorities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "problem_report_emails", :force => true do |t|
    t.string   "from_address"
    t.integer  "from_user_id"
    t.string   "to_address"
    t.string   "message"
    t.datetime "sent_on"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "problem_report_record_id"
  end

  create_table "problem_report_histories", :force => true do |t|
    t.integer  "user_id"
    t.integer  "problem_report_record_id"
    t.string   "comment"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "problem_report_notes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "problem_report_record_id"
    t.string   "comment"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.decimal  "time_spent"
  end

  create_table "problem_report_records", :force => true do |t|
    t.string   "subject"
    t.string   "description"
    t.integer  "category_id"
    t.integer  "priority_id"
    t.date     "date_entered"
    t.date     "date_completed"
    t.date     "date_due"
    t.integer  "system_type_id"
    t.integer  "escalation_id"
    t.integer  "problem_type_id"
    t.string   "room_building"
    t.string   "room_number"
    t.string   "computer_name"
    t.string   "solution"
    t.integer  "status_id"
    t.integer  "submitted_by_id"
    t.integer  "completed_by_id"
    t.string   "submitters_name"
    t.string   "submitters_email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "problem_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "systems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "ecs_id"
    t.string   "user_name"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "position_id"
    t.string   "main_phone"
    t.string   "email"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.boolean  "show_description"
    t.boolean  "show_catagory"
    t.boolean  "show_priority"
    t.boolean  "show_date_entered"
    t.boolean  "show_date_completed"
    t.boolean  "show_due_date"
    t.boolean  "show_hours_worked"
    t.boolean  "show_system_type"
    t.boolean  "show_escalation"
    t.boolean  "show_problem_type"
    t.boolean  "show_room_building"
    t.boolean  "show_room_number"
    t.boolean  "show_computer_name"
    t.boolean  "show_solution"
    t.boolean  "show_status"
    t.boolean  "show_submitted_by"
    t.boolean  "show_completed_by"
    t.boolean  "show_submitters_name"
    t.boolean  "show_submitters_email"
    t.boolean  "show_subject"
  end

  create_table "work_on_junctions", :force => true do |t|
    t.integer  "worker_id"
    t.integer  "report_worked_on_id"
    t.datetime "last_viewed"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
