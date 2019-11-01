class AllPreviousMigrations < ActiveRecord::Migration[5.2]
  def change
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

    create_table "broad_habitat_forms", force: :cascade do |t|
      t.string "label"
      t.bigint "broad_habitat_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["broad_habitat_id"], name: "index_broad_habitat_forms_on_broad_habitat_id"
    end

    create_table "broad_habitats", id: :serial, force: :cascade do |t|
      t.string "label", limit: 50, null: false
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "clutter_types", id: :serial, force: :cascade do |t|
      t.string "label", limit: 50, null: false
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "contacts", id: :serial, force: :cascade do |t|
      t.string "last_name", limit: 50, null: false
      t.string "first_name", limit: 50, null: false
      t.string "email", limit: 50
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.bigint "state_id"
      t.bigint "organization_id"
      t.index ["organization_id"], name: "index_contacts_on_organization_id"
      t.index ["state_id"], name: "index_contacts_on_state_id"
    end

    create_table "counties", force: :cascade do |t|
      t.bigint "state_id"
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["state_id"], name: "index_counties_on_state_id"
    end

    create_table "deployment_contacts", id: :serial, force: :cascade do |t|
      t.integer "deployment_id", null: false
      t.integer "contact_id", null: false
      t.string "created_by", limit: 255, null: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "last_modified_by", limit: 255, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    end

    create_table "deployment_softwares", id: :serial, force: :cascade do |t|
      t.integer "deployment_id", null: false
      t.integer "software_id", null: false
      t.integer "contact_id"
      t.string "version", limit: 50
      t.string "classifier_package", limit: 50
      t.string "other_settings", limit: 255
      t.string "created_by", limit: 255, null: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "last_modified_by", limit: 255, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.index ["contact_id"], name: "tblDeploymentSoftware_ContactID"
      t.index ["deployment_id"], name: "tblDeploymentSoftware_DeploymentID"
    end

    create_table "deployments", id: :serial, force: :cascade do |t|
      t.integer "point_location_id", null: false
      t.integer "detector_id", null: false
      t.datetime "deployment_date", null: false
      t.datetime "recovery_date"
      t.integer "contact_id", null: false
      t.integer "species_group_id"
      t.text "notes"
      t.integer "distance_range_id"
      t.integer "microphone_type_id"
      t.string "microphone_height_off_ground", limit: 255
      t.integer "microphone_orientation_id"
      t.integer "clutter_type_id"
      t.integer "clutter_percent"
      t.string "created_by", limit: 255, null: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "last_modified_by", limit: 255, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "general_issues"
      t.string "detector_issues"
      t.bigint "sample_unit_id"
      t.integer "recovery_contact_id"
      t.index ["id"], name: "tblDeployment_EventID"
      t.index ["point_location_id"], name: "tblDeployment_LocationID"
      t.index ["sample_unit_id"], name: "index_deployments_on_sample_unit_id"
      t.index ["species_group_id"], name: "tblDeployment_SpeciesGroupID"
    end

    create_table "detection_targets", force: :cascade do |t|
      t.string "label"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "detector_locations", id: :serial, force: :cascade do |t|
      t.integer "sample_unit_id", null: false
      t.string "location_name", limit: 20, null: false
      t.float "latitude"
      t.float "longitude"
      t.float "elevation"
      t.integer "local_habitat_id"
      t.text "image"
      t.string "description", limit: 255
      t.string "land_ownership", limit: 255
      t.string "created_by", limit: 255
      t.datetime "created_date", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "last_modified_by", limit: 255
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.bigint "detection_target_id"
      t.text "driving_directions"
      t.bigint "geodetic_system_id"
      t.text "land_ownership_detail"
      t.bigint "target_descriptor_id"
      t.index ["detection_target_id"], name: "index_detector_locations_on_detection_target_id"
      t.index ["geodetic_system_id"], name: "index_detector_locations_on_geodetic_system_id"
      t.index ["sample_unit_id"], name: "tblPointLocation_SiteID"
      t.index ["target_descriptor_id"], name: "index_detector_locations_on_target_descriptor_id"
    end

    create_table "detectors", id: :serial, force: :cascade do |t|
      t.string "serial_num", limit: 50, null: false
      t.string "model", limit: 50
      t.string "manufacturer", limit: 50, null: false
      t.string "firmware", limit: 50
      t.string "created_by", limit: 255, null: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "last_modified_by", limit: 255, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "owning_agency"
      t.bigint "organization_id"
      t.integer "sampling_frequency"
      t.string "pre_trigger"
      t.float "recording_length"
      t.string "hp_filter"
      t.string "auto_rec"
      t.string "trigger_sensitivity"
      t.integer "input_gain"
      t.integer "trigger_level"
      t.integer "interval"
      t.datetime "recording_start"
      t.datetime "recording_stop"
      t.index ["organization_id"], name: "index_detectors_on_organization_id"
    end

    create_table "distance_ranges", id: :serial, force: :cascade do |t|
      t.string "label", limit: 50, null: false
      t.integer "sort_order"
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "geodetic_systems", id: :serial, force: :cascade do |t|
      t.string "label", limit: 50, null: false
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "kaleidoscope_deployment_detections", id: :serial, force: :cascade do |t|
      t.integer "deployment_id", null: false
      t.datetime "night", null: false
      t.string "folder", limit: 255
      t.string "in_file", limit: 255
      t.float "channel"
      t.float "offset"
      t.float "duration"
      t.string "out_file", limit: 255
      t.datetime "detection_date"
      t.datetime "detection_time"
      t.float "detection_hour"
      t.datetime "detection_date12"
      t.datetime "detection_time12"
      t.float "detection_hour12"
      t.string "auto_id", limit: 255
      t.float "pulses"
      t.float "matching"
      t.float "margin"
      t.string "alternates", limit: 255
      t.float "n"
      t.float "fc"
      t.float "sc"
      t.float "dur"
      t.float "f_max"
      t.float "f_min"
      t.float "f_mean"
      t.string "tbc", limit: 255
      t.string "fk", limit: 255
      t.float "tk"
      t.string "s1", limit: 255
      t.string "tc", limit: 255
      t.float "qual"
      t.float "files"
      t.string "manual_idspp1", limit: 255
      t.string "manual_idspp2", limit: 255
      t.string "notes", limit: 255
      t.string "created_by", limit: 255, null: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "last_modified_by", limit: 255, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.index ["auto_id"], name: "tblDeploymentDetection1_AutoID"
    end

    create_table "local_habitats", id: :serial, force: :cascade do |t|
      t.string "label", limit: 50, null: false
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "microphone_types", id: :serial, force: :cascade do |t|
      t.string "label", limit: 20, null: false
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "organizations", id: :serial, force: :cascade do |t|
      t.string "label", limit: 50, null: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "orientations", id: :serial, force: :cascade do |t|
      t.string "label", limit: 50, null: false
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "recovery_contacts", id: :serial, force: :cascade do |t|
      t.integer "deployment_id", null: false
      t.integer "contact_id", null: false
      t.string "created_by", limit: 255, null: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "last_modified_by", limit: 255, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    end

    create_table "reports", id: :serial, force: :cascade do |t|
      t.string "report_name", limit: 255, null: false
      t.string "report_label", limit: 255, null: false
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "sample_design_types", id: :serial, force: :cascade do |t|
      t.string "label", limit: 25, null: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "sample_designs", id: :serial, force: :cascade do |t|
      t.string "label", limit: 50, null: false
      t.integer "sample_design_type_id", null: false
      t.string "description", limit: 255, null: false
      t.datetime "created_at"
      t.datetime "updated_at"
      t.index ["sample_design_type_id"], name: "index_sample_designs_on_sample_design_type_id"
    end

    create_table "sample_unit_counties", force: :cascade do |t|
      t.bigint "sample_unit_id"
      t.bigint "county_id"
      t.float "percentage"
      t.index ["county_id"], name: "index_sample_unit_counties_on_county_id"
      t.index ["sample_unit_id"], name: "index_sample_unit_counties_on_sample_unit_id"
    end

    create_table "sample_unit_states", force: :cascade do |t|
      t.bigint "sample_unit_id"
      t.bigint "state_id"
      t.float "percentage"
      t.index ["sample_unit_id"], name: "index_sample_unit_states_on_sample_unit_id"
      t.index ["state_id"], name: "index_sample_unit_states_on_state_id"
    end

    create_table "sample_units", id: :serial, force: :cascade do |t|
      t.string "site_code", limit: 20, null: false
      t.string "agency", limit: 50
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "grts"
      t.bigint "species_group_id"
      t.bigint "broad_habitat_form_id"
      t.index ["broad_habitat_form_id"], name: "index_sample_units_on_broad_habitat_form_id"
      t.index ["species_group_id"], name: "index_sample_units_on_species_group_id"
    end

    create_table "softwares", id: :serial, force: :cascade do |t|
      t.string "label", limit: 50, null: false
      t.string "summary", limit: 255
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "sonobat_deployment_detections", id: :serial, force: :cascade do |t|
      t.integer "deployment_id"
      t.datetime "night", null: false
      t.string "path", limit: 255
      t.string "filename", limit: 255
      t.float "hi_f"
      t.float "lo_f"
      t.string "spp_accp", limit: 255
      t.float "prob"
      t.float "maj"
      t.float "accp"
      t.string "spp", limit: 255
      t.string "tilde_prob", limit: 255
      t.float "fc_mean"
      t.float "fc_std_dev"
      t.float "dur_mean"
      t.float "dur_std_dev"
      t.string "calls_per_sec", limit: 255
      t.float "mean_hi_freq"
      t.float "mean_lo_freq"
      t.float "mean_uppr_slp"
      t.float "mean_lwr_slp"
      t.float "mean_total_slp"
      t.float "mean_preceding_intvl"
      t.string "first", limit: 255
      t.string "second", limit: 255
      t.string "third", limit: 255
      t.string "fourth", limit: 255
      t.string "parent_dir", limit: 255
      t.string "next_dir_up", limit: 255
      t.float "file_length"
      t.float "version"
      t.string "filter", limit: 255
      t.float "accp_quality"
      t.float "accp_qual_for_tally"
      t.float "max_calls_considered"
      t.string "manual_idspp1", limit: 255
      t.string "manual_idspp2", limit: 255
      t.string "notes", limit: 255
      t.string "created_by", limit: 255, null: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "last_modified_by", limit: 255, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.index ["deployment_id"], name: "tblDeploymentDetection7_DeploymentID"
    end

    create_table "species", id: :serial, force: :cascade do |t|
      t.string "code", limit: 10, null: false
      t.string "common_name", limit: 255
      t.string "scientific_name", limit: 255, null: false
      t.integer "tsn"
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "species_groups", id: :serial, force: :cascade do |t|
      t.string "label", limit: 50, null: false
      t.string "summary", limit: 255
      t.string "created_by", limit: 255, null: false
      t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
      t.string "last_modified_by", limit: 255, null: false
      t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    end

    create_table "species_species_groups", id: false, force: :cascade do |t|
      t.bigint "species_id", null: false
      t.bigint "species_group_id", null: false
      t.index ["species_group_id", "species_id"], name: "index_species_species_groups_on_species_group_id_and_species_id"
      t.index ["species_id", "species_group_id"], name: "index_species_species_groups_on_species_id_and_species_group_id"
    end

    create_table "states", id: :serial, force: :cascade do |t|
      t.string "state_code", limit: 2, null: false
      t.string "state_name", limit: 50, null: false
      t.datetime "updated_at"
      t.datetime "created_at"
    end

    create_table "study_areas", force: :cascade do |t|
      t.string "name"
      t.bigint "state_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["state_id"], name: "index_study_areas_on_state_id"
    end

    create_table "target_descriptors", force: :cascade do |t|
      t.string "label"
      t.bigint "detection_target_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["detection_target_id"], name: "index_target_descriptors_on_detection_target_id"
    end

    create_table "users", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.string "confirmation_token"
      t.datetime "confirmed_at"
      t.datetime "confirmation_sent_at"
      t.string "first_name"
      t.string "last_name"
      t.bigint "state_id"
      t.bigint "organization_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "role"
      t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["organization_id"], name: "index_users_on_organization_id"
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
      t.index ["state_id"], name: "index_users_on_state_id"
    end

    add_foreign_key "counties", "states"
    add_foreign_key "deployments", "sample_units"
    add_foreign_key "detector_locations", "detection_targets"
    add_foreign_key "detector_locations", "geodetic_systems"
    add_foreign_key "detector_locations", "target_descriptors"
  end
end