# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_02_222246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "broad_habitat_forms", force: :cascade do |t|
    t.string "label"
    t.bigint "broad_habitat_id", null: false
    t.index ["broad_habitat_id"], name: "index_broad_habitat_forms_on_broad_habitat_id"
  end

  create_table "broad_habitats", force: :cascade do |t|
    t.string "label"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.index ["state_id"], name: "index_counties_on_state_id"
  end

  create_table "detection_targets", force: :cascade do |t|
    t.string "label"
  end

  create_table "orientations", force: :cascade do |t|
    t.string "direction"
  end

  create_table "sample_units", primary_key: "sample_unit_id", force: :cascade do |t|
    t.string "agency"
    t.integer "grts"
    t.bigint "broad_habitat_id", null: false
    t.bigint "broad_habitat_form_id", null: false
    t.index ["broad_habitat_form_id"], name: "index_sample_units_on_broad_habitat_form_id"
    t.index ["broad_habitat_id"], name: "index_sample_units_on_broad_habitat_id"
  end

  create_table "softwares", force: :cascade do |t|
    t.string "name"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
  end

  create_table "target_descriptors", force: :cascade do |t|
    t.string "label"
    t.bigint "detection_target_id", null: false
    t.index ["detection_target_id"], name: "index_target_descriptors_on_detection_target_id"
  end

  create_table "uploads", force: :cascade do |t|
    t.string "filename"
    t.string "data"
    t.string "upload_type"
  end

  add_foreign_key "broad_habitat_forms", "broad_habitats"
  add_foreign_key "counties", "states"
  add_foreign_key "sample_units", "broad_habitat_forms"
  add_foreign_key "sample_units", "broad_habitats"
  add_foreign_key "target_descriptors", "detection_targets"
end
