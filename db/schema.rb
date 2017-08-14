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

ActiveRecord::Schema.define(version: 20170814183240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.text "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_submissions", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolio_item_attachments", force: :cascade do |t|
    t.text "attachement"
    t.bigint "portfolio_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_item_id"], name: "index_portfolio_item_attachments_on_portfolio_item_id"
  end

  create_table "portfolio_items", force: :cascade do |t|
    t.string "title"
    t.text "cover_image"
    t.text "description"
    t.bigint "portfolio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_portfolio_items_on_portfolio_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "title"
    t.text "cover_image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "portfolios_tags", id: false, force: :cascade do |t|
    t.bigint "portfolio_id", null: false
    t.bigint "tag_id", null: false
    t.index ["portfolio_id", "tag_id"], name: "index_portfolios_tags_on_portfolio_id_and_tag_id"
  end

  create_table "proposal_messages", force: :cascade do |t|
    t.text "message"
    t.bigint "user_id"
    t.bigint "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_proposal_messages_on_proposal_id"
    t.index ["user_id"], name: "index_proposal_messages_on_user_id"
  end

  create_table "proposal_requests", force: :cascade do |t|
    t.bigint "proposal_id"
    t.bigint "user_id"
    t.boolean "accepted"
    t.date "accepted_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "requested_by"
    t.index ["company_id"], name: "index_proposal_requests_on_company_id"
    t.index ["proposal_id"], name: "index_proposal_requests_on_proposal_id"
    t.index ["user_id"], name: "index_proposal_requests_on_user_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.date "deadline"
    t.integer "price"
    t.boolean "accepted", default: false
    t.bigint "company_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "proposal_type"
    t.boolean "completed"
    t.date "completed_on"
    t.boolean "is_paid"
    t.string "charge_id"
    t.index ["company_id"], name: "index_proposals_on_company_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "proposals_tags", id: false, force: :cascade do |t|
    t.bigint "proposal_id", null: false
    t.bigint "tag_id", null: false
    t.index ["proposal_id", "tag_id"], name: "index_proposals_tags_on_proposal_id_and_tag_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "accepted", default: 0
    t.bigint "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_requirements_on_proposal_id"
  end

  create_table "schedule_items", force: :cascade do |t|
    t.string "item_type"
    t.date "start_date"
    t.date "end_date"
    t.bigint "tag_id"
    t.bigint "schedule_id"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["schedule_id"], name: "index_schedule_items_on_schedule_id"
    t.index ["tag_id"], name: "index_schedule_items_on_tag_id"
  end

  create_table "schedule_items_tags", id: false, force: :cascade do |t|
    t.bigint "schedule_item_id", null: false
    t.bigint "tag_id", null: false
    t.index ["schedule_item_id", "tag_id"], name: "index_schedule_items_tags_on_schedule_item_id_and_tag_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_schedules_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tag_type"
    t.integer "parent_id"
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tags_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tag_id", null: false
    t.index ["user_id", "tag_id"], name: "index_tags_users_on_user_id_and_tag_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "roles"
    t.string "display_name"
    t.text "profile_image"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "waitlists", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "instagram"
    t.string "px500"
    t.string "facebook"
    t.string "phone"
    t.string "website"
    t.string "smugmug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "portfolio_item_attachments", "portfolio_items", on_delete: :cascade
  add_foreign_key "portfolio_items", "portfolios"
  add_foreign_key "portfolios", "users"
  add_foreign_key "proposal_messages", "proposals"
  add_foreign_key "proposal_messages", "users"
  add_foreign_key "proposal_requests", "companies"
  add_foreign_key "proposal_requests", "proposals"
  add_foreign_key "proposal_requests", "users"
  add_foreign_key "proposals", "companies"
  add_foreign_key "proposals", "users"
  add_foreign_key "requirements", "proposals"
  add_foreign_key "schedule_items", "schedules"
  add_foreign_key "schedule_items", "tags"
  add_foreign_key "schedules", "users"
  add_foreign_key "users", "companies"
end
