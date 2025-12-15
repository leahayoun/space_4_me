# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_12_15_150135) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointments", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.string "address"
    t.date "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "event_type"
    t.time "start_time"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "feelings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_feelings_on_user_id"
  end

  create_table "hormonal_treatments", force: :cascade do |t|
    t.integer "dosage"
    t.string "product_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hormonal_treatments_on_user_id"
  end

  create_table "moods", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "operations", force: :cascade do |t|
    t.date "date"
    t.string "body_part"
    t.string "organization_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "operation_type"
    t.index ["user_id"], name: "index_operations_on_user_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.string "tag"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "user_moods", force: :cascade do |t|
    t.bigint "mood_id", null: false
    t.bigint "feeling_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feeling_id"], name: "index_user_moods_on_feeling_id"
    t.index ["mood_id"], name: "index_user_moods_on_mood_id"
  end

  create_table "user_symptoms", force: :cascade do |t|
    t.bigint "symptom_id", null: false
    t.bigint "feeling_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["feeling_id"], name: "index_user_symptoms_on_feeling_id"
    t.index ["symptom_id"], name: "index_user_symptoms_on_symptom_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "birth_sex"
    t.string "gender"
    t.date "date_of_birth"
    t.boolean "onboarding", default: false
    t.string "gender_other"
    t.string "birth_sex_other"
    t.string "hormonal_treatment_status"
    t.boolean "treatment_androtardyl"
    t.boolean "treatment_nebido"
    t.boolean "treatment_bicalutamide"
    t.boolean "treatment_decapeptyl"
    t.boolean "treatment_progesterone"
    t.boolean "treatment_estreva"
    t.boolean "treatment_oestrodose"
    t.boolean "treatment_oesclim"
    t.boolean "treatment_dermestril"
    t.boolean "treatment_provames"
    t.boolean "treatment_estrofem"
    t.boolean "treatment_progynova"
    t.boolean "treatment_neofollin"
    t.boolean "treatment_gynodian"
    t.string "operation_status"
    t.boolean "operation_torsoplastie"
    t.boolean "operation_phalloplastie"
    t.boolean "operation_metaiodoplastie"
    t.boolean "operation_hysterectomie"
    t.boolean "exercices_voix_m"
    t.boolean "operation_bodybuilding_followup"
    t.boolean "operation_fronto_orbital_contouring"
    t.boolean "operation_rhinoplastie"
    t.boolean "operation_genioplastie"
    t.boolean "operation_tracheal_shave"
    t.boolean "operation_glottoplastie"
    t.boolean "operation_vaginoplastie"
    t.boolean "operation_labiaplastie"
    t.boolean "operation_orchiectomie"
    t.boolean "operation_liposculpture_feminisante"
    t.boolean "operation_bbl"
    t.boolean "exercices_voix_f"
    t.boolean "operation_epilation_laser"
    t.text "how_found"
    t.text "expectations_info"
    t.boolean "sport"
    t.boolean "epilation_laser"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointments", "users"
  add_foreign_key "diaries", "users"
  add_foreign_key "feelings", "users"
  add_foreign_key "hormonal_treatments", "users"
  add_foreign_key "operations", "users"
  add_foreign_key "tasks", "users"
  add_foreign_key "user_moods", "feelings"
  add_foreign_key "user_moods", "moods"
  add_foreign_key "user_symptoms", "feelings"
  add_foreign_key "user_symptoms", "symptoms"
end
