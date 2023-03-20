ActiveRecord::Schema[7.0].define(version: 2023_03_18_210002) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alert_tags", force: :cascade do |t|
    t.bigint "alert_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alert_id"], name: "index_alert_tags_on_alert_id"
    t.index ["tag_id"], name: "index_alert_tags_on_tag_id"
  end

  create_table "alerts", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "tag"
    t.string "description"
    t.string "origin"
    t.bigint "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_alerts_on_task_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "role_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "alert_tags", "alerts"
  add_foreign_key "alert_tags", "tags"
  add_foreign_key "alerts", "tasks"
  add_foreign_key "tasks", "users"
  add_foreign_key "users", "roles"
end
