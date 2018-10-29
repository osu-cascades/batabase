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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "broad_habitats", id: :integer, default: -> { "nextval('\"tluBroadHabitat_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "label", limit: 50, null: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["label"], name: "tluBroadHabitat_Label_key", unique: true
  end

  create_table "clutter_types", id: :integer, default: -> { "nextval('\"tluClutterType_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "label", limit: 50, null: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["label"], name: "tluClutterType_Label_key", unique: true
  end

  create_table "contacts", id: :integer, default: -> { "nextval('\"tluContact_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "last_name", limit: 50, null: false
    t.string "first_name", limit: 50, null: false
    t.string "middle_init", limit: 4
    t.string "initials", limit: 5
    t.integer "years_of_experience"
    t.string "organization", limit: 50
    t.string "position_title", limit: 50
    t.string "address_type", limit: 50
    t.string "address", limit: 50
    t.string "address_2", limit: 50
    t.string "city", limit: 50
    t.string "state_code", limit: 8
    t.string "zip_code", limit: 50
    t.string "country", limit: 50
    t.string "email_address", limit: 50
    t.string "work_phone", limit: 15
    t.string "work_extension", limit: 50
    t.text "contact_notes"
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "datums", id: :integer, default: -> { "nextval('\"tluDatum_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "label", limit: 50, null: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["label"], name: "tluDatum_Label_key", unique: true
  end

  create_table "deployment_contacts", id: :integer, default: -> { "nextval('\"tblDeploymentContact_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.integer "deployment_id", null: false
    t.integer "contact_id", null: false
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["deployment_id", "contact_id"], name: "tblDeploymentContact_DeploymentID_ContactID_key", unique: true
  end

  create_table "deployment_softwares", id: :integer, default: -> { "nextval('\"tblDeploymentSoftware_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.integer "deployment_id", null: false
    t.integer "software_id", null: false
    t.integer "contact_id"
    t.string "version", limit: 50
    t.string "classifier_package", limit: 50
    t.string "species_included_in_analysis", limit: 50
    t.integer "min_num_pulses"
    t.string "other_settings", limit: 255
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["contact_id"], name: "tblDeploymentSoftware_ContactID"
    t.index ["deployment_id", "software_id"], name: "tblDeploymentSoftware_DeploymentID_SoftwareID_key", unique: true
    t.index ["deployment_id"], name: "tblDeploymentSoftware_DeploymentID"
  end

  create_table "deployments", id: :integer, default: -> { "nextval('\"tblDeployment_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.integer "point_location_id", null: false
    t.integer "audio_logger_id", null: false
    t.datetime "deployment_date", null: false
    t.datetime "recovery_date"
    t.datetime "recording_start_date", null: false
    t.datetime "recording_start_time", null: false
    t.datetime "recording_stop_date"
    t.datetime "recording_stop_time"
    t.integer "primary_contact_id", null: false
    t.integer "species_group_id"
    t.text "notes"
    t.integer "distance_range_id"
    t.boolean "photo_of_site", default: false
    t.integer "microphone_type_id"
    t.string "microphone_serial_num", limit: 50
    t.string "mounting_system_description", limit: 255
    t.string "microphone_placement", limit: 255
    t.string "microphone_height_off_ground", limit: 255
    t.integer "microphone_orientation_id"
    t.string "microphone_housing_type", limit: 50
    t.string "microphone_calibration_method", limit: 50
    t.integer "clutter_type_id"
    t.integer "clutter_percent"
    t.string "sdcard_num_a", limit: 50
    t.string "sdcard_num_b", limit: 50
    t.string "sdcard_num_c", limit: 50
    t.string "sdcard_num_d", limit: 50
    t.string "sdcard_size_a", limit: 50
    t.string "sdcard_size_b", limit: 50
    t.string "sdcard_size_c", limit: 50
    t.string "sdcard_size_d", limit: 50
    t.datetime "expected_end_date"
    t.string "photo_equipment_info", limit: 255
    t.boolean "rh_probe", default: false
    t.string "temp_logger_num", limit: 50
    t.string "temp_sensor_placement", limit: 50
    t.string "distance_from_audio_to_temp_sensor", limit: 50
    t.string "gain_settings", limit: 255
    t.string "recording_mode", limit: 50
    t.string "sample_rate", limit: 50
    t.string "low_filter_level", limit: 50
    t.string "high_filter_level", limit: 50
    t.string "division_ratio", limit: 255
    t.float "decibel_level"
    t.string "frequency_filters", limit: 255
    t.integer "trigger_window"
    t.string "maximum_file_length", limit: 255
    t.string "file_prefix", limit: 255
    t.string "file_suffix", limit: 255
    t.string "file_folder", limit: 255
    t.string "activation_start_time", limit: 50
    t.string "activation_end_time", limit: 50
    t.text "comments"
    t.string "deployment_temperature", limit: 255
    t.string "deployment_relative_humidity", limit: 255
    t.string "deployment_sunrise_time", limit: 255
    t.string "deployment_sunset_time", limit: 255
    t.string "deployment_moon_phase", limit: 255
    t.string "deployment_moon_appearance", limit: 255
    t.string "deployment_moonrise_time", limit: 255
    t.string "deployment_moonset_time", limit: 255
    t.string "deployment_wind_speed", limit: 255
    t.string "deployment_sky_cover", limit: 255
    t.string "deployment_significant_weather_notes", limit: 255
    t.datetime "time_deployment_weather_observed"
    t.string "recovery_temperature", limit: 255
    t.string "recovery_relative_humidity", limit: 255
    t.string "recovery_sunrise_time", limit: 255
    t.string "recovery_sunset_time", limit: 255
    t.string "recovery_moon_phase", limit: 255
    t.string "recovery_moon_appearance", limit: 255
    t.string "recovery_moonrise_time", limit: 255
    t.string "recovery_moonset_time", limit: 255
    t.string "recovery_wind_speed", limit: 255
    t.string "recovery_sky_cover", limit: 255
    t.string "recovery_significant_weather_notes", limit: 255
    t.string "recovery_notes", limit: 255
    t.datetime "time_recovery_weather_observed"
    t.integer "num_files_downloaded"
    t.float "first_battery_start_voltage_v"
    t.float "first_battery_end_voltage_v"
    t.integer "first_battery_location_id"
    t.float "second_battery_start_voltage_v"
    t.float "second_battery_end_voltage_v"
    t.integer "second_battery_location_id"
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["id"], name: "tblDeployment_EventID"
    t.index ["point_location_id"], name: "tblDeployment_LocationID"
    t.index ["species_group_id"], name: "tblDeployment_SpeciesGroupID"
  end

  create_table "detector_locations", id: :integer, default: -> { "nextval('\"tblPointLocation_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.integer "site_id", null: false
    t.string "location_name", limit: 20, null: false
    t.integer "site_state_county_id", null: false
    t.integer "utm_zone"
    t.integer "datum_id"
    t.float "easting"
    t.float "northing"
    t.float "latitude"
    t.float "longitude"
    t.float "elevation"
    t.string "usgs_quad", limit: 255
    t.string "primary_access_road", limit: 255
    t.string "parking_location", limit: 255
    t.string "site_marker", limit: 255
    t.integer "water_body_type_id"
    t.integer "local_habitat_id"
    t.string "dominant_overstory", limit: 255
    t.string "dominant_understory", limit: 255
    t.text "image"
    t.string "location_description", limit: 255
    t.string "ownership", limit: 255
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["location_name"], name: "tblPointLocation_LocationName_key", unique: true
    t.index ["site_id"], name: "tblPointLocation_SiteID"
  end

  create_table "detectors", id: :integer, default: -> { "nextval('\"tluAudioLogger_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "code", limit: 20, null: false
    t.string "serial_num", limit: 50, null: false
    t.string "model", limit: 50
    t.string "manufacturer", limit: 50, null: false
    t.string "firmware", limit: 50
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["code"], name: "tluAudioLogger_Code_key", unique: true
  end

  create_table "distance_ranges", id: :integer, default: -> { "nextval('\"tluDistanceRange_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "label", limit: 50, null: false
    t.integer "sort_order"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["label"], name: "tluDistanceRange_Label_key", unique: true
  end

  create_table "kaleidoscope_deployment_detections", id: :integer, default: -> { "nextval('\"tblDeploymentDetection1_ID_seq\"'::regclass)" }, force: :cascade do |t|
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

  create_table "locat_habitats", id: :integer, default: -> { "nextval('\"tluLocalHabitat_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "label", limit: 50, null: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["label"], name: "tluLocalHabitat_Label_key", unique: true
  end

  create_table "microphone_types", id: :integer, default: -> { "nextval('\"tluMicrophoneType_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "label", limit: 20, null: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["label"], name: "tluMicrophoneType_Label_key", unique: true
  end

  create_table "orientations", id: :integer, default: -> { "nextval('\"tluOrientation_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "label", limit: 50, null: false
    t.integer "sort_order"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["label"], name: "tluOrientation_Label_key", unique: true
  end

  create_table "recovery_contacts", id: :integer, default: -> { "nextval('\"tblRecoveryContact_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.integer "deployment_id", null: false
    t.integer "contact_id", null: false
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["deployment_id", "contact_id"], name: "tblRecoveryContact_DeploymentID_ContactID_key", unique: true
  end

  create_table "reports", primary_key: "report_id", id: :integer, default: -> { "nextval('\"tblReport_ReportID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "report_name", limit: 255, null: false
    t.string "report_label", limit: 255, null: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["report_label"], name: "tblReport_ReportLabel_key", unique: true
    t.index ["report_name"], name: "tblReport_ReportName_key", unique: true
  end

  create_table "sites", id: :integer, default: -> { "nextval('\"tblSite_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "site_code", limit: 20, null: false
    t.string "park_code", limit: 4, null: false
    t.integer "sample_design_id", null: false
    t.string "sample_unit_id", limit: 20
    t.string "federal_agency", limit: 50
    t.string "site_description", limit: 255
    t.integer "broad_habitat_id"
    t.text "image"
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["park_code"], name: "tblSite_ParkCode"
    t.index ["site_code"], name: "tblSite_SiteCode_key", unique: true
  end

  create_table "softwares", id: :integer, default: -> { "nextval('\"tluSoftware_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "label", limit: 50, null: false
    t.string "summary", limit: 255
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["label"], name: "tluSoftware_Label_key", unique: true
  end

  create_table "sonobat_deployment_detections", id: :integer, default: -> { "nextval('\"tblDeploymentDetection7_ID_seq\"'::regclass)" }, force: :cascade do |t|
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
    t.string "<--all_spp_in_sqnc_classified_with_a_ann>040_in_order_of_preval", limit: 255
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

  create_table "species", id: :integer, default: -> { "nextval('\"tluSpecies_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "code", limit: 10, null: false
    t.string "common_name", limit: 255
    t.string "scientific_name", limit: 255, null: false
    t.integer "tsn"
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["code"], name: "tluSpecies_Code_key", unique: true
    t.index ["common_name"], name: "tluSpecies_CommonName_key", unique: true
    t.index ["scientific_name"], name: "tluSpecies_ScientificName_key", unique: true
    t.index ["tsn"], name: "tluSpecies_TSN_key", unique: true
  end

  create_table "species_groups", id: :integer, default: -> { "nextval('\"tluSpeciesGroup_ID_seq\"'::regclass)" }, force: :cascade do |t|
    t.string "label", limit: 50, null: false
    t.string "summary", limit: 255
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["label"], name: "tluSpeciesGroup_Label_key", unique: true
  end

  create_table "states", primary_key: "state_code", id: :string, limit: 2, force: :cascade do |t|
    t.string "state_name", limit: 50, null: false
    t.datetime "updated_at"
    t.datetime "created_at"
    t.index ["state_name"], name: "tluState_StateName_key", unique: true
  end

  create_table "tsys_backend_versions", id: :integer, default: nil, force: :cascade do |t|
    t.string "version_number", limit: 20, null: false
  end

end
