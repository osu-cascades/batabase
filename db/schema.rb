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

ActiveRecord::Schema.define(version: 2018_11_21_174921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "organization", limit: 50
    t.string "state_code", limit: 8
    t.string "email", limit: 50
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
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
    t.index ["id"], name: "tblDeployment_EventID"
    t.index ["point_location_id"], name: "tblDeployment_LocationID"
    t.index ["species_group_id"], name: "tblDeployment_SpeciesGroupID"
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
    t.string "ownership", limit: 255
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["sample_unit_id"], name: "tblPointLocation_SiteID"
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
  end

  create_table "sample_units", id: :serial, force: :cascade do |t|
    t.string "site_code", limit: 20, null: false
    t.string "federal_agency", limit: 50
    t.string "created_by", limit: 255, null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "last_modified_by", limit: 255, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
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

  create_table "states", id: :serial, force: :cascade do |t|
    t.string "state_code", limit: 2, null: false
    t.string "state_name", limit: 50, null: false
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "tblDeployment", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.integer "PointLocationID", null: false
    t.integer "AudioLoggerID", null: false
    t.datetime "DeploymentDate", null: false
    t.datetime "RecoveryDate"
    t.datetime "RecordingStartDate", null: false
    t.datetime "RecordingStartTime", null: false
    t.datetime "RecordingStopDate"
    t.datetime "RecordingStopTime"
    t.integer "PrimaryContactID", null: false
    t.integer "SpeciesGroupID"
    t.text "Notes"
    t.integer "DistanceRangeID"
    t.boolean "PhotoOfSite", default: false
    t.integer "MicrophoneTypeID"
    t.string "MicrophoneSerialNum", limit: 50
    t.string "MountingSystemDescription", limit: 255
    t.string "MicrophonePlacement", limit: 255
    t.string "MicrophoneHeightOffGround", limit: 255
    t.integer "MicrophoneOrientationID"
    t.string "MicrophoneHousingType", limit: 50
    t.string "MicrophoneCalibrationMethod", limit: 50
    t.integer "ClutterTypeID"
    t.integer "ClutterPercent"
    t.string "SDCardNumA", limit: 50
    t.string "SDCardNumB", limit: 50
    t.string "SDCardNumC", limit: 50
    t.string "SDCardNumD", limit: 50
    t.string "SDCardSizeA", limit: 50
    t.string "SDCardSizeB", limit: 50
    t.string "SDCardSizeC", limit: 50
    t.string "SDCardSizeD", limit: 50
    t.datetime "ExpectedEndDate"
    t.string "PhotoEquipmentInfo", limit: 255
    t.boolean "RHProbe", default: false
    t.string "TempLoggerNum", limit: 50
    t.string "TempSensorPlacement", limit: 50
    t.string "DistanceFromAudioToTempSensor", limit: 50
    t.string "GainSettings", limit: 255
    t.string "RecordingMode", limit: 50
    t.string "SampleRate", limit: 50
    t.string "LowFilterLevel", limit: 50
    t.string "HighFilterLevel", limit: 50
    t.string "DivisionRatio", limit: 255
    t.float "DecibelLevel"
    t.string "FrequencyFilters", limit: 255
    t.integer "TriggerWindow"
    t.string "MaximumFileLength", limit: 255
    t.string "FilePrefix", limit: 255
    t.string "FileSuffix", limit: 255
    t.string "FileFolder", limit: 255
    t.string "ActivationStartTime", limit: 50
    t.string "ActivationEndTime", limit: 50
    t.text "Comments"
    t.string "DeploymentTemperature", limit: 255
    t.string "DeploymentRelativeHumidity", limit: 255
    t.string "DeploymentSunriseTime", limit: 255
    t.string "DeploymentSunsetTime", limit: 255
    t.string "DeploymentMoonPhase", limit: 255
    t.string "DeploymentMoonAppearance", limit: 255
    t.string "DeploymentMoonriseTime", limit: 255
    t.string "DeploymentMoonsetTime", limit: 255
    t.string "DeploymentWindSpeed", limit: 255
    t.string "DeploymentSkyCover", limit: 255
    t.string "DeploymentSignificantWeatherNotes", limit: 255
    t.datetime "TimeDeploymentWeatherObserved"
    t.string "RecoveryTemperature", limit: 255
    t.string "RecoveryRelativeHumidity", limit: 255
    t.string "RecoverySunriseTime", limit: 255
    t.string "RecoverySunsetTime", limit: 255
    t.string "RecoveryMoonPhase", limit: 255
    t.string "RecoverytMoonAppearance", limit: 255
    t.string "RecoveryMoonriseTime", limit: 255
    t.string "RecoveryMoonsetTime", limit: 255
    t.string "RecoveryWindSpeed", limit: 255
    t.string "RecoverySkyCover", limit: 255
    t.string "RecoverySignificantWeatherNotes", limit: 255
    t.string "RecoveryNotes", limit: 255
    t.datetime "TimeRecoveryWeatherObserved"
    t.integer "NumFilesDownloaded"
    t.float "FirstBatteryStartVoltage_V"
    t.float "FirstBatteryEndVoltage_V"
    t.integer "FirstBatteryLocationID"
    t.float "SecondBatteryStartVoltage_V"
    t.float "SecondBatteryEndVoltage_V"
    t.integer "SecondBatteryLocationID"
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "tblDeploymentContact", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.integer "DeploymentID", null: false
    t.integer "ContactID", null: false
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["DeploymentID", "ContactID"], name: "tblDeploymentContact_DeploymentID_ContactID_key", unique: true
  end

  create_table "tblDeploymentDetection1", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.integer "DeploymentID", null: false
    t.datetime "Night", null: false
    t.string "Folder", limit: 255
    t.string "InFile", limit: 255
    t.float "Channel"
    t.float "Offset"
    t.float "Duration"
    t.string "OutFile", limit: 255
    t.datetime "DetectionDate"
    t.datetime "DetectionTime"
    t.float "DetectionHour"
    t.datetime "DetectionDate12"
    t.datetime "DetectionTime12"
    t.float "DetectionHour12"
    t.string "AutoID", limit: 255
    t.float "Pulses"
    t.float "Matching"
    t.float "Margin"
    t.string "Alternates", limit: 255
    t.float "N"
    t.float "Fc"
    t.float "Sc"
    t.float "Dur"
    t.float "Fmax"
    t.float "Fmin"
    t.float "Fmean"
    t.string "TBC", limit: 255
    t.string "Fk", limit: 255
    t.float "Tk"
    t.string "S1", limit: 255
    t.string "Tc", limit: 255
    t.float "Qual"
    t.float "Files"
    t.string "ManualIDSpp1", limit: 255
    t.string "ManualIDSpp2", limit: 255
    t.string "Notes", limit: 255
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "tblDeploymentDetection7", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.integer "DeploymentID"
    t.datetime "Night", null: false
    t.string "Path", limit: 255
    t.string "Filename", limit: 255
    t.float "HiF"
    t.float "LoF"
    t.string "SppAccp", limit: 255
    t.float "Prob"
    t.float "#Maj"
    t.float "#Accp"
    t.string "~Spp", limit: 255
    t.string "~Prob", limit: 255
    t.float "Fc mean"
    t.float "Fc StdDev"
    t.float "Dur mean"
    t.float "Dur StdDev"
    t.string "calls/sec", limit: 255
    t.float "mean HiFreq"
    t.float "mean LoFreq"
    t.float "mean UpprSlp"
    t.float "mean LwrSlp"
    t.float "mean TotalSlp"
    t.float "mean PrecedingIntvl"
    t.string "1st", limit: 255
    t.string "2nd", limit: 255
    t.string "3rd", limit: 255
    t.string "4th", limit: 255
    t.string "<--All spp in sqnc classified with a ANN>040 in order of preval", limit: 255
    t.string "ParentDir", limit: 255
    t.string "NextDirUp", limit: 255
    t.float "FileLength(sec)"
    t.float "Version"
    t.string "Filter", limit: 255
    t.float "AccpQuality"
    t.float "AccpQualForTally"
    t.float "Max#CallsConsidered"
    t.string "ManualIDSpp1", limit: 255
    t.string "ManualIDSpp2", limit: 255
    t.string "Notes", limit: 255
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "tblDeploymentSoftware", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.integer "DeploymentID", null: false
    t.integer "SoftwareID", null: false
    t.integer "ContactID"
    t.string "Version", limit: 50
    t.string "ClassifierPackage", limit: 50
    t.string "SpeciesIncludedInAnalysis", limit: 50
    t.integer "MinNumPulses"
    t.string "OtherSettings", limit: 255
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["DeploymentID", "SoftwareID"], name: "tblDeploymentSoftware_DeploymentID_SoftwareID_key", unique: true
  end

  create_table "tblPointLocation", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.integer "SiteID", null: false
    t.string "LocationName", limit: 20, null: false
    t.integer "SiteStateCountyID", null: false
    t.integer "UTMZone"
    t.integer "DatumID"
    t.float "Easting"
    t.float "Northing"
    t.float "Latitude"
    t.float "Longitude"
    t.float "Elevation"
    t.string "USGSQuad", limit: 255
    t.string "PrimaryAccessRoad", limit: 255
    t.string "ParkingLocation", limit: 255
    t.string "SiteMarker", limit: 255
    t.integer "WaterBodyTypeID"
    t.integer "LocalHabitatID"
    t.string "DominantOverstory", limit: 255
    t.string "DominantUnderstory", limit: 255
    t.text "Images"
    t.string "LocationDescription", limit: 255
    t.string "Ownership", limit: 255
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["LocationName"], name: "tblPointLocation_LocationName_key", unique: true
  end

  create_table "tblRecoveryContact", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.integer "DeploymentID", null: false
    t.integer "ContactID", null: false
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["DeploymentID", "ContactID"], name: "tblRecoveryContact_DeploymentID_ContactID_key", unique: true
  end

  create_table "tblReport", primary_key: "ReportID", id: :serial, force: :cascade do |t|
    t.string "ReportName", limit: 255, null: false
    t.string "ReportLabel", limit: 255, null: false
    t.index ["ReportLabel"], name: "tblReport_ReportLabel_key", unique: true
    t.index ["ReportName"], name: "tblReport_ReportName_key", unique: true
  end

  create_table "tblSite", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "SiteCode", limit: 20, null: false
    t.string "ParkCode", limit: 4, null: false
    t.integer "SampleDesignID", null: false
    t.string "SampleUnitID", limit: 20
    t.string "FederalAgency", limit: 50
    t.string "SiteDescription", limit: 255
    t.integer "BroadHabitatID"
    t.text "Images"
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["ParkCode"], name: "tblSite_ParkCode"
    t.index ["SiteCode"], name: "tblSite_SiteCode_key", unique: true
  end

  create_table "tluAudioLogger", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Code", limit: 20, null: false
    t.string "SerialNum", limit: 50, null: false
    t.string "Model", limit: 50
    t.string "Manufacturer", limit: 50, null: false
    t.string "Firmware", limit: 50
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Code"], name: "tluAudioLogger_Code_key", unique: true
  end

  create_table "tluBroadHabitat", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 50, null: false
    t.index ["Label"], name: "tluBroadHabitat_Label_key", unique: true
  end

  create_table "tluClutterType", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 50, null: false
    t.index ["Label"], name: "tluClutterType_Label_key", unique: true
  end

  create_table "tluContact", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "LastName", limit: 50, null: false
    t.string "FirstName", limit: 50, null: false
    t.string "MiddleInit", limit: 4
    t.string "Initials", limit: 5
    t.integer "YearsOfExperience"
    t.string "Organization", limit: 50
    t.string "PositionTitle", limit: 50
    t.string "AddressType", limit: 50
    t.string "Address", limit: 50
    t.string "Address2", limit: 50
    t.string "City", limit: 50
    t.string "StateCode", limit: 8
    t.string "ZipCode", limit: 50
    t.string "Country", limit: 50
    t.string "EmailAddress", limit: 50
    t.string "WorkPhone", limit: 15
    t.string "WorkExtension", limit: 50
    t.text "ContactNotes"
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "tluDatum", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 50, null: false
    t.index ["Label"], name: "tluDatum_Label_key", unique: true
  end

  create_table "tluDistanceRange", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 50, null: false
    t.integer "SortOrder"
    t.index ["Label"], name: "tluDistanceRange_Label_key", unique: true
  end

  create_table "tluLocalHabitat", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 50, null: false
    t.index ["Label"], name: "tluLocalHabitat_Label_key", unique: true
  end

  create_table "tluMicrophoneType", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 20, null: false
    t.index ["Label"], name: "tluMicrophoneType_Label_key", unique: true
  end

  create_table "tluOrientation", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 50, null: false
    t.integer "SortOrder"
    t.index ["Label"], name: "tluOrientation_Label_key", unique: true
  end

  create_table "tluSampleDesign", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 50, null: false
    t.integer "SampleDesignTypeID", null: false
    t.string "Description", limit: 255, null: false
    t.index ["Label", "SampleDesignTypeID", "Description"], name: "tluSampleDesign_Label_SampleDesignTypeID_Description_key", unique: true
  end

  create_table "tluSampleDesignType", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 25, null: false
    t.integer "SortOrder"
    t.index ["Label"], name: "tluSampleDesignType_Label_key", unique: true
  end

  create_table "tluSoftware", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 50, null: false
    t.string "Summary", limit: 255
    t.index ["Label"], name: "tluSoftware_Label_key", unique: true
  end

  create_table "tluSpecies", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Code", limit: 10, null: false
    t.string "CommonName", limit: 255
    t.string "ScientificName", limit: 255, null: false
    t.integer "TSN"
    t.index ["Code"], name: "tluSpecies_Code_key", unique: true
    t.index ["CommonName"], name: "tluSpecies_CommonName_key", unique: true
    t.index ["ScientificName"], name: "tluSpecies_ScientificName_key", unique: true
    t.index ["TSN"], name: "tluSpecies_TSN_key", unique: true
  end

  create_table "tluSpeciesGroup", primary_key: "ID", id: :serial, force: :cascade do |t|
    t.string "Label", limit: 50, null: false
    t.string "Summary", limit: 255
    t.string "CreatedBy", limit: 255, null: false
    t.datetime "CreatedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LastModifiedBy", limit: 255, null: false
    t.datetime "LastModifiedDate", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["Label"], name: "tluSpeciesGroup_Label_key", unique: true
  end

  create_table "tluState", primary_key: "StateCode", id: :string, limit: 2, force: :cascade do |t|
    t.string "StateName", limit: 50, null: false
    t.index ["StateName"], name: "tluState_StateName_key", unique: true
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
