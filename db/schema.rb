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

ActiveRecord::Schema.define(version: 2020_03_12_072027) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "broad_habitat_forms", force: :cascade do |t|
    t.string "name"
    t.bigint "broad_habitat_id", null: false
    t.index ["broad_habitat_id"], name: "index_broad_habitat_forms_on_broad_habitat_id"
  end

  create_table "broad_habitats", force: :cascade do |t|
    t.string "name"
  end

  create_table "clutter_percents", force: :cascade do |t|
    t.string "label"
  end

  create_table "clutter_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "notes"
    t.bigint "state_id", null: false
    t.bigint "organization_id", null: false
    t.index ["organization_id"], name: "index_contacts_on_organization_id"
    t.index ["state_id"], name: "index_contacts_on_state_id"
  end

  create_table "counties", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.index ["state_id"], name: "index_counties_on_state_id"
  end

  create_table "deployments", force: :cascade do |t|
    t.text "comments"
    t.decimal "microphone_height_off_ground", precision: 5, scale: 2, default: "3.0"
    t.string "microphone_orientation", default: ""
    t.integer "sampling_frequency", default: 500
    t.string "pre_trigger", default: "OFF"
    t.string "recording_length", default: "5"
    t.string "hp_filter", default: "NO"
    t.string "auto_record", default: "YES"
    t.string "trigger_sensitivity", default: "MED"
    t.integer "input_gain", default: 45
    t.string "trigger_level", default: "160"
    t.integer "interval", default: 0
    t.integer "gain", default: 12
    t.string "sixteen_thousand_high_filter", default: "OFF"
    t.integer "sample_rate", default: 384
    t.string "min_duration", default: "1.5"
    t.string "max_duration", default: "none"
    t.integer "min_trigger_frequency", default: 7
    t.integer "trigger_window", default: 3
    t.string "max_length", default: "00:05"
    t.string "compression", default: "none"
    t.datetime "deployment_date"
    t.datetime "recovery_date"
    t.datetime "recording_start"
    t.datetime "recording_stop"
    t.bigint "primary_contact_id"
    t.bigint "recovery_contact_id"
    t.bigint "detector_location_id", null: false
    t.bigint "detector_id", null: false
    t.bigint "distance_range_id"
    t.bigint "clutter_type_id", null: false
    t.bigint "clutter_percent_id"
    t.index ["clutter_percent_id"], name: "index_deployments_on_clutter_percent_id"
    t.index ["clutter_type_id"], name: "index_deployments_on_clutter_type_id"
    t.index ["detector_id"], name: "index_deployments_on_detector_id"
    t.index ["detector_location_id"], name: "index_deployments_on_detector_location_id"
    t.index ["distance_range_id"], name: "index_deployments_on_distance_range_id"
    t.index ["primary_contact_id"], name: "index_deployments_on_primary_contact_id"
    t.index ["recovery_contact_id"], name: "index_deployments_on_recovery_contact_id"
  end

  create_table "detection_targets", force: :cascade do |t|
    t.string "label"
  end

  create_table "detector_locations", force: :cascade do |t|
    t.string "quad_id"
    t.integer "quad_no"
    t.string "location_identifier"
    t.string "location_name"
    t.decimal "latitude", precision: 5, scale: 2
    t.decimal "longitude", precision: 5, scale: 2
    t.decimal "elevation", precision: 5, scale: 1
    t.string "driving_directions"
    t.string "land_ownership"
    t.bigint "sample_unit_id", null: false
    t.bigint "target_descriptor_id", null: false
    t.bigint "local_habitat_id", null: false
    t.bigint "detection_target_id", null: false
    t.index ["detection_target_id"], name: "index_detector_locations_on_detection_target_id"
    t.index ["local_habitat_id"], name: "index_detector_locations_on_local_habitat_id"
    t.index ["sample_unit_id"], name: "index_detector_locations_on_sample_unit_id"
    t.index ["target_descriptor_id"], name: "index_detector_locations_on_target_descriptor_id"
  end

  create_table "detectors", force: :cascade do |t|
    t.string "firmware"
    t.string "manufacturer"
    t.string "model"
    t.string "serial_number"
    t.bigint "organization_id", null: false
    t.index ["organization_id"], name: "index_detectors_on_organization_id"
  end

  create_table "distance_ranges", force: :cascade do |t|
    t.string "label"
  end

  create_table "geodetic_systems", force: :cascade do |t|
    t.string "label"
  end

  create_table "local_habitats", force: :cascade do |t|
    t.string "label"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
  end

  create_table "sample_unit_counties", force: :cascade do |t|
    t.decimal "percentage", precision: 5, scale: 2
    t.bigint "county_id", null: false
    t.bigint "sample_unit_id", null: false
    t.index ["county_id"], name: "index_sample_unit_counties_on_county_id"
    t.index ["sample_unit_id"], name: "index_sample_unit_counties_on_sample_unit_id"
  end

  create_table "sample_unit_states", force: :cascade do |t|
    t.decimal "percentage", precision: 5, scale: 2
    t.bigint "state_id", null: false
    t.bigint "sample_unit_id", null: false
    t.index ["sample_unit_id"], name: "index_sample_unit_states_on_sample_unit_id"
    t.index ["state_id"], name: "index_sample_unit_states_on_state_id"
  end

  create_table "sample_units", force: :cascade do |t|
    t.integer "code"
    t.integer "grts"
    t.bigint "broad_habitat_id"
    t.bigint "broad_habitat_form_id"
    t.index ["broad_habitat_form_id"], name: "index_sample_units_on_broad_habitat_form_id"
    t.index ["broad_habitat_id"], name: "index_sample_units_on_broad_habitat_id"
  end

  create_table "softwares", force: :cascade do |t|
    t.string "name", default: "Sonobat 4"
    t.string "version"
    t.string "classifier_package"
    t.float "acceptable_call_quality", default: 0.8
    t.float "sequence_decision_threshold", default: 0.9
    t.integer "max_no_calls", default: 16
    t.string "log_file_notes"
    t.string "other_settings"
    t.bigint "contact_id", null: false
    t.index ["contact_id"], name: "index_softwares_on_contact_id"
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
  add_foreign_key "contacts", "organizations"
  add_foreign_key "contacts", "states"
  add_foreign_key "counties", "states"
  add_foreign_key "deployments", "clutter_percents"
  add_foreign_key "deployments", "clutter_types"
  add_foreign_key "deployments", "contacts", column: "primary_contact_id"
  add_foreign_key "deployments", "contacts", column: "recovery_contact_id"
  add_foreign_key "deployments", "detector_locations"
  add_foreign_key "deployments", "detectors"
  add_foreign_key "deployments", "distance_ranges"
  add_foreign_key "detector_locations", "detection_targets"
  add_foreign_key "detector_locations", "local_habitats"
  add_foreign_key "detector_locations", "sample_units"
  add_foreign_key "detector_locations", "target_descriptors"
  add_foreign_key "detectors", "organizations"
  add_foreign_key "sample_unit_counties", "counties"
  add_foreign_key "sample_unit_counties", "sample_units"
  add_foreign_key "sample_unit_states", "sample_units"
  add_foreign_key "sample_unit_states", "states"
  add_foreign_key "sample_units", "broad_habitat_forms"
  add_foreign_key "sample_units", "broad_habitats"
  add_foreign_key "softwares", "contacts"
  add_foreign_key "target_descriptors", "detection_targets"
end
