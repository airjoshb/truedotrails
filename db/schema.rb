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

ActiveRecord::Schema.define(version: 2019_02_15_190333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "approvals", force: :cascade do |t|
    t.string "approvable_type"
    t.bigint "approvable_id"
    t.datetime "approved_at"
    t.text "notes"
    t.datetime "rejected_at"
    t.bigint "user_action_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["approvable_type", "approvable_id"], name: "index_approvals_on_approvable_type_and_approvable_id"
    t.index ["user_action_id"], name: "index_approvals_on_user_action_id"
    t.index ["user_id"], name: "index_approvals_on_user_id"
  end

  create_table "challenge_steps", force: :cascade do |t|
    t.string "title"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "seq_number"
    t.integer "user_actions_count", default: 0
    t.index ["challenge_id"], name: "index_challenge_steps_on_challenge_id"
    t.index ["slug"], name: "index_challenge_steps_on_slug", unique: true
  end

  create_table "challenges", force: :cascade do |t|
    t.string "title"
    t.integer "clam_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_challenges_on_slug", unique: true
  end

  create_table "clam_credits", force: :cascade do |t|
    t.string "reason"
    t.string "transaction_id"
    t.integer "amount"
    t.integer "balance"
    t.integer "operation"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clam_credits_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["challenge_id"], name: "index_comments_on_challenge_id"
    t.index ["user_id", "challenge_id", "created_at"], name: "index_comments_on_user_id_and_challenge_id_and_created_at"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contents", force: :cascade do |t|
    t.text "body"
    t.text "lede"
    t.string "contentable_type"
    t.bigint "contentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contentable_type", "contentable_id"], name: "index_contents_on_contentable_type_and_contentable_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "user_actions", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "active"
    t.string "proof"
    t.bigint "user_id"
    t.bigint "challenge_step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.boolean "private"
    t.index ["challenge_step_id"], name: "index_user_actions_on_challenge_step_id"
    t.index ["user_id"], name: "index_user_actions_on_user_id"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.integer "clam_credits_total", default: 0
    t.string "referral_code"
    t.integer "referrer_id"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "approvals", "user_actions"
  add_foreign_key "approvals", "users"
  add_foreign_key "clam_credits", "users"
  add_foreign_key "comments", "challenges"
  add_foreign_key "comments", "users"
  add_foreign_key "user_actions", "challenge_steps"
  add_foreign_key "user_actions", "users"
end
