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

ActiveRecord::Schema.define(:version => 20121030234403) do

  create_table "batteries", :force => true do |t|
    t.string   "device",     :null => false
    t.integer  "capacity",   :null => false
    t.integer  "charge",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "batteries", ["device"], :name => "uq_battery_device", :unique => true

  create_table "feed_queues", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "feed_type",  :null => false
    t.integer  "priority",   :null => false
    t.integer  "batch_size", :null => false
    t.string   "merchant",   :null => false
    t.datetime "last_drain"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "feed_queues", ["merchant", "feed_type"], :name => "uq_feed_queue_merchant_type", :unique => true

  create_table "feed_task_dependencies", :force => true do |t|
    t.integer  "task_id",       :null => false
    t.integer  "dependency_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "feed_task_dependencies", ["task_id", "dependency_id"], :name => "uq_feed_task_dep", :unique => true

  create_table "feed_tasks", :force => true do |t|
    t.string   "sku",            :null => false
    t.integer  "queue_id",       :null => false
    t.string   "operation_type", :null => false
    t.text     "body",           :null => false
    t.integer  "transaction_id"
    t.integer  "index"
    t.text     "failure"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "feed_transactions", :force => true do |t|
    t.integer  "identifier", :limit => 8, :null => false
    t.string   "state",                   :null => false
    t.string   "failure"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "feed_transactions", ["identifier"], :name => "uq_feed_tx_identifier", :unique => true
  add_index "feed_transactions", ["state"], :name => "idx_feed_tx_state"

  create_table "queue_classic_jobs", :force => true do |t|
    t.string   "q_name"
    t.string   "method"
    t.text     "args"
    t.datetime "locked_at"
  end

  add_index "queue_classic_jobs", ["q_name", "id"], :name => "idx_qc_on_name_only_unlocked"

end
