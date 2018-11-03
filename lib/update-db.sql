-- Drop tables
DROP TABLE IF EXISTS "tblAudioLoggerMaint","tblDefinitionDetection6","tblDeploymentDetection2","tblDeploymentDetection3","tblDeploymentDetection4","tblDeploymentDetection5","tblDeploymentDetection6","tblHighLowTemperature","tblMaintenance","tblMobileRoute","tblMobileSurvey","tblMobileSurveyContact","tblMobileSurveyDetection1","tblMobileSurveyDetection2","tblMobileSurveyDetection3","tblMobileSurveyDetection4","tblMobileSurveyDetection5","tblMobileSurveyDetection6","tblMobileSurveyDetection7","tblMobileSurveySoftware","tblSiteStateCounty","tluBatteryLocation","tluBatteryType","tluPark","tluSampleDesign","tluSampleDesignType","tluWaterBodyType","xrefSpeciesSpeciesGroup";

CREATE TABLE organizations (

  created_at timestamp without time zone,
  id SERIAL PRIMARY KEY NOT NULL,
  updated_at timestamp without time zone,
  label varchar(50) NOT NULL
);
-- Rename tables
ALTER TABLE "tblDeployment" RENAME TO deployments;
ALTER TABLE "tblDeploymentContact" RENAME TO deployment_contacts;
ALTER TABLE "tblDeploymentDetection1" RENAME TO kaleidoscope_deployment_detections;
ALTER TABLE "tblDeploymentDetection7" RENAME TO sonobat_deployment_detections;
ALTER TABLE "tblDeploymentSoftware" RENAME TO deployment_softwares;
ALTER TABLE "tblPointLocation" RENAME TO detector_locations;
ALTER TABLE "tblRecoveryContact" RENAME TO recovery_contacts;
ALTER TABLE "tblReport" RENAME TO reports;
ALTER TABLE "tluAudioLogger" RENAME TO detectors;
ALTER TABLE "tluBroadHabitat" RENAME TO broad_habitats;
ALTER TABLE "tluClutterType" RENAME TO clutter_types;
ALTER TABLE "tluContact" RENAME TO contacts;
ALTER TABLE "tluDatum" RENAME TO geodetic_systems;
ALTER TABLE "tluDistanceRange" RENAME TO distance_ranges;
ALTER TABLE "tluLocalHabitat" RENAME TO local_habitats;
ALTER TABLE "tluMicrophoneType" RENAME TO microphone_types;
ALTER TABLE "tluOrientation" RENAME TO orientations;
ALTER TABLE "tluSoftware" RENAME TO softwares;
ALTER TABLE "tluSpecies" RENAME TO species;
ALTER TABLE "tluSpeciesGroup" RENAME TO species_groups;
ALTER TABLE "tluState" RENAME TO states;
ALTER TABLE "tsysBackendVersion" RENAME TO tsys_backend_versions;
ALTER TABLE "tblSite" RENAME TO sample_units;

--Rename columns
-----------------------------------------
ALTER TABLE public.contacts RENAME COLUMN "FirstName" TO first_name;
ALTER TABLE public.contacts RENAME COLUMN "LastName" TO last_name;
ALTER TABLE public.contacts RENAME COLUMN "StateCode" TO state_code;
ALTER TABLE public.contacts RENAME COLUMN "EmailAddress" TO email;
ALTER TABLE public.contacts RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.contacts RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.contacts RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.contacts RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.contacts RENAME COLUMN "Organization" TO organization;
ALTER TABLE public.deployment_contacts RENAME COLUMN "DeploymentID" TO deployment_id;
ALTER TABLE public.deployment_contacts RENAME COLUMN "ContactID" TO contact_id;
ALTER TABLE public.deployment_contacts RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.deployment_contacts RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.deployment_contacts RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.deployment_contacts RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.deployment_softwares RENAME COLUMN "DeploymentID" TO deployment_id;
ALTER TABLE public.deployment_softwares RENAME COLUMN "SoftwareID" TO software_id;
ALTER TABLE public.deployment_softwares RENAME COLUMN "ContactID" TO contact_id;
ALTER TABLE public.deployment_softwares RENAME COLUMN "Version" TO version;
ALTER TABLE public.deployment_softwares RENAME COLUMN "ClassifierPackage" TO classifier_package;
ALTER TABLE public.deployment_softwares RENAME COLUMN "OtherSettings" TO other_settings;
ALTER TABLE public.deployment_softwares RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.deployment_softwares RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.deployment_softwares RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.deployment_softwares RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.deployments RENAME COLUMN "PointLocationID" TO point_location_id;
ALTER TABLE public.deployments RENAME COLUMN "AudioLoggerID" TO detector_id;
ALTER TABLE public.deployments RENAME COLUMN "DeploymentDate" TO deployment_date;
ALTER TABLE public.deployments RENAME COLUMN "RecoveryDate" TO recovery_date;
ALTER TABLE public.deployments RENAME COLUMN "PrimaryContactID" TO contact_id;
ALTER TABLE public.deployments RENAME COLUMN "SpeciesGroupID" TO species_group_id;
ALTER TABLE public.deployments RENAME COLUMN "DistanceRangeID" TO distance_range_id;
ALTER TABLE public.deployments RENAME COLUMN "MicrophoneTypeID" TO microphone_type_id;
ALTER TABLE public.deployments RENAME COLUMN "MicrophoneHeightOffGround" TO microphone_height_off_ground;
ALTER TABLE public.deployments RENAME COLUMN "MicrophoneOrientationID" TO microphone_orientation_id;
ALTER TABLE public.deployments RENAME COLUMN "ClutterTypeID" TO clutter_type_id;
ALTER TABLE public.deployments RENAME COLUMN "ClutterPercent" TO clutter_percent;
ALTER TABLE public.deployments RENAME COLUMN "Notes" TO notes;
ALTER TABLE public.deployments RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.deployments RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.deployments RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.deployments RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.detector_locations RENAME COLUMN "SiteID" TO sample_unit_id;
ALTER TABLE public.detector_locations RENAME COLUMN "LocationName" TO location_name;
ALTER TABLE public.detector_locations RENAME COLUMN "LocalHabitatID" TO local_habitat_id;
ALTER TABLE public.detector_locations RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.detector_locations RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.detector_locations RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.detector_locations RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.detector_locations RENAME COLUMN "Latitude" TO latitude;
ALTER TABLE public.detector_locations RENAME COLUMN "Longitude" TO longitude;
ALTER TABLE public.detector_locations RENAME COLUMN "Elevation" TO elevation;
ALTER TABLE public.detector_locations RENAME COLUMN "Images" TO image;
ALTER TABLE public.detector_locations RENAME COLUMN "Ownership" TO ownership;
ALTER TABLE public.detectors RENAME COLUMN "SerialNum" TO serial_num;
ALTER TABLE public.detectors RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.detectors RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.detectors RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.detectors RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.detectors RENAME COLUMN "Model" TO model;
ALTER TABLE public.detectors RENAME COLUMN "Manufacturer" TO manufacturer;
ALTER TABLE public.detectors RENAME COLUMN "Firmware" TO firmware;
ALTER TABLE public.distance_ranges RENAME COLUMN "SortOrder" TO sort_order;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "DeploymentID" TO deployment_id;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "InFile" TO in_file;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "OutFile" TO out_file;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "DetectionDate" TO detection_date;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "DetectionTime" TO detection_time;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "DetectionHour" TO detection_hour;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "DetectionDate12" TO detection_date12;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "DetectionTime12" TO detection_time12;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "DetectionHour12" TO detection_hour12;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "AutoID" TO auto_id;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "ManualIDSpp1" TO manual_idspp1;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "ManualIDSpp2" TO manual_idspp2;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Night" TO night;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Folder" TO folder;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Channel" TO channel;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Offset" TO "offset";
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Duration" TO duration;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Pulses" TO pulses;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Matching" TO matching;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Margin" TO margin;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Alternates" TO alternates;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "N" TO n;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Fc" TO fc;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Sc" TO sc;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Dur" TO dur;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Fmax" TO f_max;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Fmin" TO f_min;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Fmean" TO f_mean;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "TBC" TO tbc;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Fk" TO fk;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Tk" TO tk;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "S1" TO s1;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Tc" TO tc;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Qual" TO qual;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Files" TO files;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "Notes" TO notes;
ALTER TABLE public.orientations RENAME COLUMN "SortOrder" TO sort_order;
ALTER TABLE public.recovery_contacts RENAME COLUMN "DeploymentID" TO deployment_id;
ALTER TABLE public.recovery_contacts RENAME COLUMN "ContactID" TO contact_id;
ALTER TABLE public.recovery_contacts RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.recovery_contacts RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.recovery_contacts RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.recovery_contacts RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.reports RENAME COLUMN "ReportName" TO report_name;
ALTER TABLE public.reports RENAME COLUMN "ReportLabel" TO report_label;
ALTER TABLE public.reports RENAME COLUMN "ReportID" TO id;
ALTER TABLE public.sample_units RENAME COLUMN "SiteCode" TO site_code;
ALTER TABLE public.sample_units RENAME COLUMN "FederalAgency" TO federal_agency;
ALTER TABLE public.sample_units RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.sample_units RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.sample_units RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.sample_units RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "DeploymentID" TO deployment_id;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "HiF" TO hi_f;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "LoF" TO lo_f;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "SppAccp" TO spp_accp;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Fc mean" TO fc_mean;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Fc StdDev" TO fc_std_dev;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Dur mean" TO dur_mean;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Dur StdDev" TO dur_std_dev;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "mean HiFreq" TO mean_hi_freq;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "mean LoFreq" TO mean_lo_freq;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "mean UpprSlp" TO mean_uppr_slp;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "mean LwrSlp" TO mean_lwr_slp;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "mean TotalSlp" TO mean_total_slp;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "mean PrecedingIntvl" TO mean_preceding_intvl;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "<--All spp in sqnc classified with a ANN>040 in order of preval" TO "<--all_spp_in_sqnc_classified_with_a_ann>040_in_order_of_preval";
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "ParentDir" TO parent_dir;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "NextDirUp" TO next_dir_up;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "FileLength(sec)" TO "file_length(sec)";
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "AccpQuality" TO accp_quality;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "AccpQualForTally" TO accp_qual_for_tally;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Max#CallsConsidered" TO "max#calls_considered";
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "ManualIDSpp1" TO manual_idspp1;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "ManualIDSpp2" TO manual_idspp2;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Night" TO night;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Path" TO path;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Filename" TO filename;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Prob" TO prob;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "#Maj" TO maj;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "#Accp" TO accp;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "~Spp" TO spp;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "~Prob" TO tilde_prob;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "calls/sec" TO calls_per_sec;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "1st" TO first;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "2nd" TO second;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "3rd" TO third;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "4th" TO fourth;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "file_length(sec)" TO file_length;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Version" TO version;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Filter" TO filter;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "max#calls_considered" TO max_calls_considered;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "Notes" TO notes;
ALTER TABLE public.species RENAME COLUMN "CommonName" TO common_name;
ALTER TABLE public.species RENAME COLUMN "ScientificName" TO scientific_name;
ALTER TABLE public.species RENAME COLUMN "Code" TO code;
ALTER TABLE public.species RENAME COLUMN "TSN" TO tsn;
ALTER TABLE public.species_groups RENAME COLUMN "CreatedBy" TO created_by;
ALTER TABLE public.species_groups RENAME COLUMN "LastModifiedBy" TO last_modified_by;
ALTER TABLE public.species_groups RENAME COLUMN "CreatedDate" TO created_date;
ALTER TABLE public.species_groups RENAME COLUMN "LastModifiedDate" TO last_modified_date;
ALTER TABLE public.species_groups RENAME COLUMN "Summary" TO summary;
ALTER TABLE public.states RENAME COLUMN "StateCode" TO state_code;
ALTER TABLE public.states RENAME COLUMN "StateName" TO state_name;
ALTER TABLE public.tsys_backend_versions RENAME COLUMN "VersionNumber" TO version_number;
ALTER TABLE public.softwares RENAME COLUMN "Summary" TO summary;
ALTER TABLE public.broad_habitats RENAME COLUMN "Label" TO label;
ALTER TABLE public.broad_habitats RENAME COLUMN "ID" TO id;
ALTER TABLE public.broad_habitats ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.clutter_types RENAME COLUMN "Label" TO label;
ALTER TABLE public.clutter_types RENAME COLUMN "ID" TO id;
ALTER TABLE public.clutter_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.contacts RENAME COLUMN "ID" TO id;
ALTER TABLE public.contacts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.geodetic_systems RENAME COLUMN "Label" TO label;
ALTER TABLE public.geodetic_systems RENAME COLUMN "ID" TO id;
ALTER TABLE public.geodetic_systems ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.deployment_contacts RENAME COLUMN "ID" TO id;
ALTER TABLE public.deployment_contacts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.deployment_softwares RENAME COLUMN "ID" TO id;
ALTER TABLE public.deployment_softwares ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.deployments RENAME COLUMN "ID" TO id;
ALTER TABLE public.deployments ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.detector_locations RENAME COLUMN "ID" TO id;
ALTER TABLE public.detector_locations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.detectors RENAME COLUMN "ID" TO id;
ALTER TABLE public.detectors ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.distance_ranges RENAME COLUMN "Label" TO label;
ALTER TABLE public.distance_ranges RENAME COLUMN "ID" TO id;
ALTER TABLE public.distance_ranges ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "ID" TO id;
ALTER TABLE public.kaleidoscope_deployment_detections ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.local_habitats RENAME COLUMN "Label" TO label;
ALTER TABLE public.local_habitats RENAME COLUMN "ID" TO id;
ALTER TABLE public.local_habitats ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.microphone_types RENAME COLUMN "Label" TO label;
ALTER TABLE public.microphone_types RENAME COLUMN "ID" TO id;
ALTER TABLE public.microphone_types ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.orientations RENAME COLUMN "Label" TO label;
ALTER TABLE public.orientations RENAME COLUMN "ID" TO id;
ALTER TABLE public.orientations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.recovery_contacts RENAME COLUMN "ID" TO id;
ALTER TABLE public.recovery_contacts ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sample_units RENAME COLUMN "ID" TO id;
ALTER TABLE public.sample_units ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.softwares RENAME COLUMN "Label" TO label;
ALTER TABLE public.softwares RENAME COLUMN "ID" TO id;
ALTER TABLE public.softwares ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "ID" TO id;
ALTER TABLE public.sonobat_deployment_detections ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.species RENAME COLUMN "ID" TO id;
ALTER TABLE public.species ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.species_groups RENAME COLUMN "Label" TO label;
ALTER TABLE public.species_groups RENAME COLUMN "ID" TO id;
ALTER TABLE public.species_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.tsys_backend_versions RENAME COLUMN "ID" TO id;
ALTER TABLE public.tsys_backend_versions ALTER COLUMN id DROP DEFAULT;

-- Drop Columns
  -- Deployments
ALTER TABLE deployments DROP COLUMN "RecordingStartDate";
ALTER TABLE deployments DROP COLUMN "RecordingStartTime";
ALTER TABLE deployments DROP COLUMN "RecordingStopDate";
ALTER TABLE deployments DROP COLUMN "RecordingStopTime";
ALTER TABLE deployments DROP COLUMN "PhotoOfSite";
ALTER TABLE deployments DROP COLUMN "MicrophoneSerialNum";
ALTER TABLE deployments DROP COLUMN "MountingSystemDescription";
ALTER TABLE deployments DROP COLUMN "MicrophonePlacement";
ALTER TABLE deployments DROP COLUMN "MicrophoneHousingType";
ALTER TABLE deployments DROP COLUMN "MicrophoneCalibrationMethod";
ALTER TABLE deployments DROP COLUMN "SDCardNumA";
ALTER TABLE deployments DROP COLUMN "SDCardNumB";
ALTER TABLE deployments DROP COLUMN "SDCardNumC";
ALTER TABLE deployments DROP COLUMN "SDCardNumD";
ALTER TABLE deployments DROP COLUMN "SDCardSizeA";
ALTER TABLE deployments DROP COLUMN "SDCardSizeB";
ALTER TABLE deployments DROP COLUMN "SDCardSizeC";
ALTER TABLE deployments DROP COLUMN "SDCardSizeD";
ALTER TABLE deployments DROP COLUMN "ExpectedEndDate";
ALTER TABLE deployments DROP COLUMN "PhotoEquipmentInfo";
ALTER TABLE deployments DROP COLUMN "RHProbe";
ALTER TABLE deployments DROP COLUMN "TempLoggerNum";
ALTER TABLE deployments DROP COLUMN "TempSensorPlacement";
ALTER TABLE deployments DROP COLUMN "DistanceFromAudioToTempSensor";
ALTER TABLE deployments DROP COLUMN "GainSettings";
ALTER TABLE deployments DROP COLUMN "RecordingMode";
ALTER TABLE deployments DROP COLUMN "SampleRate";
ALTER TABLE deployments DROP COLUMN "LowFilterLevel";
ALTER TABLE deployments DROP COLUMN "HighFilterLevel";
ALTER TABLE deployments DROP COLUMN "DivisionRatio";
ALTER TABLE deployments DROP COLUMN "DecibelLevel";
ALTER TABLE deployments DROP COLUMN "FrequencyFilters";
ALTER TABLE deployments DROP COLUMN "TriggerWindow";
ALTER TABLE deployments DROP COLUMN "MaximumFileLength";
ALTER TABLE deployments DROP COLUMN "FilePrefix";
ALTER TABLE deployments DROP COLUMN "FileSuffix";
ALTER TABLE deployments DROP COLUMN "FileFolder";
ALTER TABLE deployments DROP COLUMN "ActivationStartTime";
ALTER TABLE deployments DROP COLUMN "ActivationEndTime";
ALTER TABLE deployments DROP COLUMN "Comments";
ALTER TABLE deployments DROP COLUMN "DeploymentTemperature";
ALTER TABLE deployments DROP COLUMN "DeploymentRelativeHumidity";
ALTER TABLE deployments DROP COLUMN "DeploymentSunriseTime";
ALTER TABLE deployments DROP COLUMN "DeploymentSunsetTime";
ALTER TABLE deployments DROP COLUMN "DeploymentMoonPhase";
ALTER TABLE deployments DROP COLUMN "DeploymentMoonAppearance";
ALTER TABLE deployments DROP COLUMN "DeploymentMoonriseTime";
ALTER TABLE deployments DROP COLUMN "DeploymentMoonsetTime";
ALTER TABLE deployments DROP COLUMN "DeploymentWindSpeed";
ALTER TABLE deployments DROP COLUMN "DeploymentSkyCover";
ALTER TABLE deployments DROP COLUMN "DeploymentSignificantWeatherNotes";
ALTER TABLE deployments DROP COLUMN "TimeDeploymentWeatherObserved";
ALTER TABLE deployments DROP COLUMN "RecoveryTemperature";
ALTER TABLE deployments DROP COLUMN "RecoveryRelativeHumidity";
ALTER TABLE deployments DROP COLUMN "RecoverySunriseTime";
ALTER TABLE deployments DROP COLUMN "RecoverySunsetTime";
ALTER TABLE deployments DROP COLUMN "RecoveryMoonPhase";
ALTER TABLE deployments DROP COLUMN "RecoverytMoonAppearance";
ALTER TABLE deployments DROP COLUMN "RecoveryMoonriseTime";
ALTER TABLE deployments DROP COLUMN "RecoveryMoonsetTime";
ALTER TABLE deployments DROP COLUMN "RecoveryWindSpeed";
ALTER TABLE deployments DROP COLUMN "RecoverySkyCover";
ALTER TABLE deployments DROP COLUMN "RecoverySignificantWeatherNotes";
ALTER TABLE deployments DROP COLUMN "RecoveryNotes";
ALTER TABLE deployments DROP COLUMN "TimeRecoveryWeatherObserved";
ALTER TABLE deployments DROP COLUMN "NumFilesDownloaded";
ALTER TABLE deployments DROP COLUMN "FirstBatteryStartVoltage_V";
ALTER TABLE deployments DROP COLUMN "FirstBatteryEndVoltage_V";
ALTER TABLE deployments DROP COLUMN "FirstBatteryLocationID";
ALTER TABLE deployments DROP COLUMN "SecondBatteryStartVoltage_V";
ALTER TABLE deployments DROP COLUMN "SecondBatteryEndVoltage_V";
ALTER TABLE deployments DROP COLUMN "SecondBatteryLocationID";

  -- Softwares
ALTER TABLE deployment_softwares DROP COLUMN "SpeciesIncludedInAnalysis";
ALTER TABLE deployment_softwares DROP COLUMN "MinNumPulses";

  -- Detector Locations
ALTER TABLE detector_locations DROP COLUMN "SiteStateCountyID";
ALTER TABLE detector_locations DROP COLUMN "UTMZone";
ALTER TABLE detector_locations DROP COLUMN "DatumID";
ALTER TABLE detector_locations DROP COLUMN "Easting";
ALTER TABLE detector_locations DROP COLUMN "Northing";
ALTER TABLE detector_locations DROP COLUMN "USGSQuad";
ALTER TABLE detector_locations DROP COLUMN "PrimaryAccessRoad";
ALTER TABLE detector_locations DROP COLUMN "ParkingLocation";
ALTER TABLE detector_locations DROP COLUMN "SiteMarker";
ALTER TABLE detector_locations DROP COLUMN "WaterBodyTypeID";
ALTER TABLE detector_locations DROP COLUMN "DominantOverstory";
ALTER TABLE detector_locations DROP COLUMN "DominantUnderstory";
ALTER TABLE detector_locations DROP COLUMN "LocationDescription";

  -- Sample Units
ALTER TABLE sample_units DROP COLUMN "ParkCode";
ALTER TABLE sample_units DROP COLUMN "SampleDesignID";
ALTER TABLE sample_units DROP COLUMN "SampleUnitID";
ALTER TABLE sample_units DROP COLUMN "SiteDescription";
ALTER TABLE sample_units DROP COLUMN "BroadHabitatID";
ALTER TABLE sample_units DROP COLUMN "Images";

  -- Detectors (Audio Logger)
ALTER TABLE detectors DROP COLUMN "Code";

  -- Contacts
ALTER TABLE contacts DROP COLUMN "MiddleInit";
ALTER TABLE contacts DROP COLUMN "Initials";
ALTER TABLE contacts DROP COLUMN "YearsOfExperience";
ALTER TABLE contacts DROP COLUMN "PositionTitle";
ALTER TABLE contacts DROP COLUMN "AddressType";
ALTER TABLE contacts DROP COLUMN "Address";
ALTER TABLE contacts DROP COLUMN "Address2";
ALTER TABLE contacts DROP COLUMN "City";
ALTER TABLE contacts DROP COLUMN "ZipCode";
ALTER TABLE contacts DROP COLUMN "Country";
ALTER TABLE contacts DROP COLUMN "WorkPhone";
ALTER TABLE contacts DROP COLUMN "WorkExtension";
ALTER TABLE contacts DROP COLUMN "ContactNotes";

-- Created at, updated at - Rails convention
ALTER TABLE broad_habitats ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE broad_habitats ADD COLUMN created_at timestamp without time zone;
ALTER TABLE clutter_types ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE clutter_types ADD COLUMN created_at timestamp without time zone;
ALTER TABLE public.contacts RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.contacts RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE geodetic_systems ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE geodetic_systems ADD COLUMN created_at timestamp without time zone;
ALTER TABLE public.deployment_contacts RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.deployment_contacts RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE public.deployment_softwares RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.deployment_softwares RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE public.deployments RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.deployments RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE public.detector_locations RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.detector_locations RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE public.detectors RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.detectors RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE distance_ranges ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE distance_ranges ADD COLUMN created_at timestamp without time zone;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.kaleidoscope_deployment_detections RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE local_habitats ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE local_habitats ADD COLUMN created_at timestamp without time zone;
ALTER TABLE microphone_types ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE microphone_types ADD COLUMN created_at timestamp without time zone;
ALTER TABLE orientations ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE orientations ADD COLUMN created_at timestamp without time zone;
ALTER TABLE public.recovery_contacts RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.recovery_contacts RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE reports ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE reports ADD COLUMN created_at timestamp without time zone;
ALTER TABLE public.sample_units RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.sample_units RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE softwares ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE softwares ADD COLUMN created_at timestamp without time zone;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.sonobat_deployment_detections RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE species ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE species ADD COLUMN created_at timestamp without time zone;
ALTER TABLE public.species_groups RENAME COLUMN "created_date" TO created_at;
ALTER TABLE public.species_groups RENAME COLUMN "last_modified_date" TO updated_at;
ALTER TABLE states ADD COLUMN updated_at timestamp without time zone;
ALTER TABLE states ADD COLUMN created_at timestamp without time zone;

-- Primary keys
ALTER TABLE states ADD COLUMN id SERIAL;
ALTER TABLE broad_habitats DROP CONSTRAINT "tluBroadHabitat_pkey";
ALTER TABLE clutter_types DROP CONSTRAINT "tluClutterType_pkey";
ALTER TABLE contacts DROP CONSTRAINT "tluContact_pkey";
ALTER TABLE geodetic_systems DROP CONSTRAINT "tluDatum_pkey";
ALTER TABLE deployment_contacts DROP CONSTRAINT "tblDeploymentContact_pkey";
ALTER TABLE deployment_softwares DROP CONSTRAINT "tblDeploymentSoftware_pkey";
ALTER TABLE deployments DROP CONSTRAINT "tblDeployment_pkey";
ALTER TABLE detector_locations DROP CONSTRAINT "tblPointLocation_pkey";
ALTER TABLE detectors DROP CONSTRAINT "tluAudioLogger_pkey";
ALTER TABLE distance_ranges DROP CONSTRAINT "tluDistanceRange_pkey";
ALTER TABLE kaleidoscope_deployment_detections DROP CONSTRAINT "tblDeploymentDetection1_pkey";
ALTER TABLE local_habitats DROP CONSTRAINT "tluLocalHabitat_pkey";
ALTER TABLE microphone_types DROP CONSTRAINT "tluMicrophoneType_pkey";
ALTER TABLE orientations DROP CONSTRAINT "tluOrientation_pkey";
ALTER TABLE recovery_contacts DROP CONSTRAINT "tblRecoveryContact_pkey";
ALTER TABLE reports DROP CONSTRAINT "tblReport_pkey";
ALTER TABLE sample_units DROP CONSTRAINT "tblSite_pkey";
ALTER TABLE softwares DROP CONSTRAINT "tluSoftware_pkey";
ALTER TABLE sonobat_deployment_detections DROP CONSTRAINT "tblDeploymentDetection7_pkey";
ALTER TABLE species DROP CONSTRAINT "tluSpecies_pkey";
ALTER TABLE species_groups DROP CONSTRAINT "tluSpeciesGroup_pkey";
ALTER TABLE states DROP CONSTRAINT "tluState_pkey";

ALTER TABLE broad_habitats ADD PRIMARY KEY (id);
ALTER TABLE clutter_types ADD PRIMARY KEY (id);
ALTER TABLE contacts ADD PRIMARY KEY (id);
ALTER TABLE geodetic_systems ADD PRIMARY KEY (id);
ALTER TABLE deployment_contacts ADD PRIMARY KEY (id);
ALTER TABLE deployment_softwares ADD PRIMARY KEY (id);
ALTER TABLE deployments ADD PRIMARY KEY (id);
ALTER TABLE detector_locations ADD PRIMARY KEY (id);
ALTER TABLE detectors ADD PRIMARY KEY (id);
ALTER TABLE distance_ranges ADD PRIMARY KEY (id);
ALTER TABLE kaleidoscope_deployment_detections ADD PRIMARY KEY (id);
ALTER TABLE local_habitats ADD PRIMARY KEY (id);
ALTER TABLE microphone_types ADD PRIMARY KEY (id);
ALTER TABLE orientations ADD PRIMARY KEY (id);
ALTER TABLE recovery_contacts ADD PRIMARY KEY (id);
ALTER TABLE reports ADD PRIMARY KEY (id);
ALTER TABLE sample_units ADD PRIMARY KEY (id);
ALTER TABLE softwares ADD PRIMARY KEY (id);
ALTER TABLE sonobat_deployment_detections ADD PRIMARY KEY (id);
ALTER TABLE species ADD PRIMARY KEY (id);
ALTER TABLE species_groups ADD PRIMARY KEY (id);
ALTER TABLE states ADD PRIMARY KEY (id);

CREATE SEQUENCE broad_habitats_id_seq OWNED BY broad_habitats.id;
CREATE SEQUENCE clutter_types_id_seq OWNED BY clutter_types.id;
CREATE SEQUENCE contacts_id_seq OWNED BY contacts.id;
CREATE SEQUENCE geodetic_systems_id_seq OWNED BY geodetic_systems.id;
CREATE SEQUENCE deployment_contacts_id_seq OWNED BY deployment_contacts.id;
CREATE SEQUENCE deployment_softwares_id_seq OWNED BY deployment_softwares.id;
CREATE SEQUENCE deployments_id_seq OWNED BY deployments.id;
CREATE SEQUENCE detector_locations_id_seq OWNED BY detector_locations.id;
CREATE SEQUENCE detectors_id_seq OWNED BY detectors.id;
CREATE SEQUENCE distance_ranges_id_seq OWNED BY distance_ranges.id;
CREATE SEQUENCE kaleidoscope_deployment_detections_id_seq OWNED BY kaleidoscope_deployment_detections.id;
CREATE SEQUENCE local_habitats_id_seq OWNED BY local_habitats.id;
CREATE SEQUENCE microphone_types_id_seq OWNED BY microphone_types.id;
CREATE SEQUENCE orientations_id_seq OWNED BY orientations.id;
CREATE SEQUENCE recovery_contacts_id_seq OWNED BY recovery_contacts.id;
CREATE SEQUENCE reports_id_seq OWNED BY reports.id;
CREATE SEQUENCE sample_units_id_seq OWNED BY sample_units.id;
CREATE SEQUENCE softwares_id_seq OWNED BY softwares.id;
CREATE SEQUENCE sonobat_deployment_detections_id_seq OWNED BY sonobat_deployment_detections.id;
CREATE SEQUENCE species_id_seq OWNED BY species.id;
CREATE SEQUENCE species_groups_id_seq OWNED BY species_groups.id;

SELECT setval('broad_habitats_id_seq', coalesce(max(id), 1)) FROM broad_habitats;
SELECT setval('clutter_types_id_seq', coalesce(max(id), 1)) FROM clutter_types;
SELECT setval('contacts_id_seq', coalesce(max(id), 1)) FROM contacts;
SELECT setval('geodetic_systems_id_seq', coalesce(max(id), 1)) FROM geodetic_systems;
SELECT setval('deployment_contacts_id_seq', coalesce(max(id), 1)) FROM deployment_contacts;
SELECT setval('deployment_softwares_id_seq', coalesce(max(id), 1)) FROM deployment_softwares;
SELECT setval('deployments_id_seq', coalesce(max(id), 1)) FROM deployments;
SELECT setval('detector_locations_id_seq', coalesce(max(id), 1)) FROM detector_locations;
SELECT setval('detectors_id_seq', coalesce(max(id), 1)) FROM detectors;
SELECT setval('distance_ranges_id_seq', coalesce(max(id), 1)) FROM distance_ranges;
SELECT setval('kaleidoscope_deployment_detections_id_seq', coalesce(max(id), 1)) FROM kaleidoscope_deployment_detections;
SELECT setval('local_habitats_id_seq', coalesce(max(id), 1)) FROM local_habitats;
SELECT setval('microphone_types_id_seq', coalesce(max(id), 1)) FROM microphone_types;
SELECT setval('orientations_id_seq', coalesce(max(id), 1)) FROM orientations;
SELECT setval('recovery_contacts_id_seq', coalesce(max(id), 1)) FROM recovery_contacts;
SELECT setval('reports_id_seq', coalesce(max(id), 1)) FROM reports;
SELECT setval('sample_units_id_seq', coalesce(max(id), 1)) FROM sample_units;
SELECT setval('softwares_id_seq', coalesce(max(id), 1)) FROM softwares;
SELECT setval('sonobat_deployment_detections_id_seq', coalesce(max(id), 1)) FROM sonobat_deployment_detections;
SELECT setval('species_id_seq', coalesce(max(id), 1)) FROM species;
SELECT setval('species_groups_id_seq', coalesce(max(id), 1)) FROM species_groups;
SELECT setval('states_id_seq', coalesce(max(id), 1)) FROM states;

ALTER TABLE reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq');
ALTER TABLE broad_habitats ALTER COLUMN id SET DEFAULT nextval('broad_habitats_id_seq');
ALTER TABLE clutter_types ALTER COLUMN id SET DEFAULT nextval('clutter_types_id_seq');
ALTER TABLE contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq');
ALTER TABLE geodetic_systems ALTER COLUMN id SET DEFAULT nextval('geodetic_systems_id_seq');
ALTER TABLE deployment_contacts ALTER COLUMN id SET DEFAULT nextval('deployment_contacts_id_seq');
ALTER TABLE deployment_softwares ALTER COLUMN id SET DEFAULT nextval('deployment_softwares_id_seq');
ALTER TABLE deployments ALTER COLUMN id SET DEFAULT nextval('deployments_id_seq');
ALTER TABLE detector_locations ALTER COLUMN id SET DEFAULT nextval('detector_locations_id_seq');
ALTER TABLE detectors ALTER COLUMN id SET DEFAULT nextval('detectors_id_seq');
ALTER TABLE distance_ranges ALTER COLUMN id SET DEFAULT nextval('distance_ranges_id_seq');
ALTER TABLE kaleidoscope_deployment_detections ALTER COLUMN id SET DEFAULT nextval('kaleidoscope_deployment_detections_id_seq');
ALTER TABLE local_habitats ALTER COLUMN id SET DEFAULT nextval('local_habitats_id_seq');
ALTER TABLE microphone_types ALTER COLUMN id SET DEFAULT nextval('microphone_types_id_seq');
ALTER TABLE orientations ALTER COLUMN id SET DEFAULT nextval('orientations_id_seq');
ALTER TABLE recovery_contacts ALTER COLUMN id SET DEFAULT nextval('recovery_contacts_id_seq');
ALTER TABLE reports ALTER COLUMN id SET DEFAULT nextval('reports_id_seq');
ALTER TABLE sample_units ALTER COLUMN id SET DEFAULT nextval('sample_units_id_seq');
ALTER TABLE softwares ALTER COLUMN id SET DEFAULT nextval('softwares_id_seq');
ALTER TABLE sonobat_deployment_detections ALTER COLUMN id SET DEFAULT nextval('sonobat_deployment_detections_id_seq');
ALTER TABLE species ALTER COLUMN id SET DEFAULT nextval('species_id_seq');
ALTER TABLE species_groups ALTER COLUMN id SET DEFAULT nextval('species_groups_id_seq');
ALTER TABLE states ALTER COLUMN id SET DEFAULT nextval('states_id_seq');

-- Remove indexes
ALTER TABLE broad_habitats DROP CONSTRAINT "tluBroadHabitat_Label_key";
ALTER TABLE clutter_types DROP CONSTRAINT "tluClutterType_Label_key";
ALTER TABLE deployment_contacts DROP CONSTRAINT "tblDeploymentContact_DeploymentID_ContactID_key";
ALTER TABLE deployment_softwares DROP CONSTRAINT "tblDeploymentSoftware_DeploymentID_SoftwareID_key";
ALTER TABLE detector_locations DROP CONSTRAINT "tblPointLocation_LocationName_key";
ALTER TABLE distance_ranges DROP CONSTRAINT "tluDistanceRange_Label_key";
ALTER TABLE geodetic_systems DROP CONSTRAINT "tluDatum_Label_key";
ALTER TABLE local_habitats DROP CONSTRAINT "tluLocalHabitat_Label_key";
ALTER TABLE microphone_types DROP CONSTRAINT "tluMicrophoneType_Label_key";
ALTER TABLE orientations DROP CONSTRAINT "tluOrientation_Label_key";
ALTER TABLE recovery_contacts DROP CONSTRAINT "tblRecoveryContact_DeploymentID_ContactID_key";
ALTER TABLE reports DROP CONSTRAINT "tblReport_ReportLabel_key";
ALTER TABLE reports DROP CONSTRAINT "tblReport_ReportName_key";
ALTER TABLE sample_units DROP CONSTRAINT "tblSite_SiteCode_key";
ALTER TABLE softwares DROP CONSTRAINT "tluSoftware_Label_key";
ALTER TABLE species DROP CONSTRAINT "tluSpecies_Code_key";
ALTER TABLE species DROP CONSTRAINT "tluSpecies_CommonName_key";
ALTER TABLE species DROP CONSTRAINT "tluSpecies_ScientificName_key";
ALTER TABLE species DROP CONSTRAINT "tluSpecies_TSN_key";
ALTER TABLE species_groups DROP CONSTRAINT "tluSpeciesGroup_Label_key";
ALTER TABLE states DROP CONSTRAINT "tluState_StateName_key";
