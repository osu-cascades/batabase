# frozen_string_literal: true

require 'activerecord-import/base'

# load the appropriate database adapter (postgresql, mysql2, sqlite3, etc)
require 'activerecord-import/active_record/adapters/postgresql_adapter'
require 'csv'

# Import state data from csv
columns = [:name, :abbreviation]
values = CSV.read(Rails.root.join('db/seed_data/states.csv'))

State.import columns, values

# Import county data from csv
columns = [:state_id, :name]
values = CSV.read(Rails.root.join('db/seed_data/counties.csv'))

County.import columns, values

# Import organization data from csv
columns = [:name]
values = CSV.read(Rails.root.join('db/seed_data/organizations.csv'))

Organization.import columns, values

# Import contact data from csv
columns = [:last_name, :first_name, :notes, :organization_id, :state_id]
values = CSV.read(Rails.root.join('db/seed_data/contacts.csv'))

Contact.import columns, values

# Import detector data from csv
columns = [:firmware, :manufacturer, :model, :serial_number, :organization_id]
values = CSV.read(Rails.root.join('db/seed_data/detectors.csv'))

Detector.import columns, values

# Import detection target data from csv
columns = [:label]
values = CSV.read(Rails.root.join('db/seed_data/detection_targets.csv'))

DetectionTarget.import columns, values

# Import target descriptor data from csv
columns = [:detection_target_id, :label]
values = CSV.read(Rails.root.join('db/seed_data/target_descriptors.csv'))

TargetDescriptor.import columns, values

# Import broad habitat data from csv
columns = [:name]
values = CSV.read(Rails.root.join('db/seed_data/broad_habitats.csv'))

BroadHabitat.import columns, values

# Import broad habitat form data from csv
columns = [:broad_habitat_id, :name]
values = CSV.read(Rails.root.join('db/seed_data/broad_habitat_forms.csv'))

BroadHabitatForm.import columns, values

# Import clutter type data from csv
columns = [:name]
values = CSV.read(Rails.root.join('db/seed_data/clutter_types.csv'))

ClutterType.import columns, values

# Import clutter percent data from csv
columns = [:label]
values = CSV.read(Rails.root.join('db/seed_data/clutter_percents.csv'))

ClutterPercent.import columns, values

# Import distance range data from csv
columns = [:label]
values = CSV.read(Rails.root.join('db/seed_data/distance_ranges.csv'))

DistanceRange.import columns, values

# Import software data from csv
columns = [:name]
values = CSV.read(Rails.root.join('db/seed_data/softwares.csv'))

Software.import columns, values

# Import local habitat data from csv
columns = [:label]
values = CSV.read(Rails.root.join('db/seed_data/local_habitats.csv'))

LocalHabitat.import columns, values

# Import geodetic system data from csv
columns = [:label]
values = CSV.read(Rails.root.join('db/seed_data/geodetic_systems.csv'))

GeodeticSystem.import columns, values

# Import sample unit data from csv
columns = [:code, :grts, :broad_habitat_id, :broad_habitat_form_id]
values = CSV.read(Rails.root.join('db/seed_data/sample_units.csv'))

SampleUnit.import columns, values

# Import sample unit state data from csv
columns = [:sample_unit_id, :state_id, :percentage]
values = CSV.read(Rails.root.join('db/seed_data/sample_unit_states.csv'))

SampleUnitState.import columns, values

# Import sample unit county data from csv
columns = [:sample_unit_id, :county_id, :percentage]
values = CSV.read(Rails.root.join('db/seed_data/sample_unit_counties.csv'))

SampleUnitCounty.import columns, values

# Import species data from csv
columns = [:code, :common_name, :scientific_name]
values = CSV.read(Rails.root.join('db/seed_data/species.csv'))

Species.import columns, values

# Import species group data from csv
columns = [:label, :summary]
values = CSV.read(Rails.root.join('db/seed_data/species_groups.csv'))

SpeciesGroup.import columns, values

# Import species and species group relational data from csv
columns = [:species_group_id, :species_id]
values = CSV.read(Rails.root.join('db/seed_data/species_species_groups.csv'))

SpeciesSpeciesGroup.import columns, values

# Import detector location data from csv
columns = [
  :quad_id,
  :quad_no,
  :location_identifier,
  :location_name,
  :latitude,
  :longitude,
  :elevation,
  :driving_directions,
  :land_ownership,
  :sample_unit_id,
  :detection_target_id,
  :target_descriptor_id,
  :local_habitat_id
]
values = CSV.read(Rails.root.join('db/seed_data/detector_locations.csv'))

DetectorLocation.import columns, values

# Import deployments data from csv
columns = [
  :comments,
  :microphone_height_off_ground,
  :microphone_orientation,
  :sampling_frequency,
  :pre_trigger,
  :recording_length,
  :hp_filter,
  :auto_record,
  :trigger_sensitivity,
  :input_gain,
  :trigger_level,
  :interval,
  :gain,
  :sixteen_thousand_high_filter,
  :sample_rate,
  :min_duration,
  :max_duration,
  :min_trigger_frequency,
  :trigger_window,
  :max_length,
  :compression,
  :deployment_date,
  :recovery_date,
  :recording_start,
  :recording_stop,
  :primary_contact_id,
  :recovery_contact_id,
  :detector_location_id,
  :detector_id,
  :distance_range_id,
  :clutter_type_id,
  :clutter_percent_id
]
values = CSV.read(Rails.root.join('db/seed_data/deployments.csv'))

Deployment.import columns, values

# Import sonobat outputs data from csv
columns = [
  :deployment_id,
  :night,
  :filename,
  :hi_f,
  :lo_f,
  :spp_accp,
  :prob,
  :maj,
  :accp,
  :spp,
  :tilde_prob,
  :fc_mean,
  :fc_std_dev,
  :dur_mean,
  :dur_std_dev,
  :calls_per_sec,
  :mean_hi_freq,
  :mean_lo_freq,
  :mean_uppr_slp,
  :mean_lwr_slp,
  :mean_total_slp,
  :mean_preceding_intvl,
  :first,
  :second,
  :third,
  :fourth,
  :parent_dir,
  :next_dir_up,
  :file_length,
  :version,
  :filter,
  :accp_quality,
  :accp_qual_for_tally,
  :max_calls_considered,
  :manual_idspp1,
  :manual_idspp2,
  :notes
]
values = CSV.read(Rails.root.join('db/seed_data/sonobat_outputs.csv'))

SonobatOutput.import columns, values

User.create!(email: 'test@test.test', password: 'password', confirmed_at: Time.now)
