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

ActiveRecord::Schema.define(version: 2019_02_05_190833) do

  create_table "charges", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "horse_id"
    t.date "date", null: false
    t.string "description", null: false
    t.string "amount", null: false
    t.index ["horse_id"], name: "index_charges_on_horse_id"
  end

  create_table "coggins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "horse_id"
    t.string "coggin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["horse_id"], name: "index_coggins_on_horse_id"
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "horse_id"
    t.date "date", null: false
    t.string "description", null: false
    t.string "time", null: false
    t.text "notes"
    t.index ["horse_id"], name: "index_events_on_horse_id"
  end

  create_table "farriers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip_code", null: false
  end

  create_table "horses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "registered_name"
    t.string "barn_name", null: false
    t.string "breed", null: false
    t.string "discipline"
    t.bigint "user_id", null: false
    t.bigint "veterinarian_id", null: false
    t.bigint "farrier_id", null: false
    t.string "picture"
    t.index ["farrier_id"], name: "index_horses_on_farrier_id"
    t.index ["user_id"], name: "index_horses_on_user_id"
    t.index ["veterinarian_id"], name: "index_horses_on_veterinarian_id"
  end

  create_table "medications", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "horse_id"
    t.string "medication_name"
    t.string "medication_for"
    t.string "medication_time"
    t.string "medication_day"
    t.string "medication_frequency"
    t.string "medication_dosage"
    t.text "medication_notes"
    t.index ["horse_id"], name: "index_medications_on_horse_id"
  end

  create_table "notes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "horse_id", null: false
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["horse_id"], name: "index_notes_on_horse_id"
  end

  create_table "problems", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "horse_id"
    t.date "date", null: false
    t.string "description", null: false
    t.string "time", null: false
    t.text "notes"
    t.integer "user_id"
    t.index ["horse_id"], name: "index_events_on_horse_id"
  end

  create_table "states", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "state_code", null: false
    t.string "state_name"
    t.index ["state_code"], name: "index_states_on_state_code", unique: true
  end

  create_table "symptoms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "horse_id"
    t.integer "problem_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip_code", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token", null: false
    t.datetime "confirmed_at", default: -> { "CURRENT_TIMESTAMP" }
    t.datetime "confirmation_sent_at", null: false
    t.string "unconfirmed_email"
    t.string "role", default: "member", null: false
    t.integer "roles_mask"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "veterinarians", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone_number", null: false
    t.string "address", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip_code", null: false
  end

end
