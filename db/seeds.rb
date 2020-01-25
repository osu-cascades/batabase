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

# Import software data from csv
columns = [:name]
values = CSV.read(Rails.root.join('db/seed_data/softwares.csv'))

Software.import columns, values

# Import orientation data from csv
columns = [:direction]
values = CSV.read(Rails.root.join('db/seed_data/orientations.csv'))

Orientation.import columns, values

# Import sampling frequency data from csv
columns = [:frequency]
values = CSV.read(Rails.root.join('db/seed_data/sampling_frequencies.csv'))

SamplingFrequency.import columns, values

# Import pre-triggers data from csv
columns = [:delay]
values = CSV.read(Rails.root.join('db/seed_data/pre_triggers.csv'))

PreTrigger.import columns, values

# Import trigger sensitivities data from csv
columns = [:sensitivity]
values = CSV.read(Rails.root.join('db/seed_data/trigger_sensitivities.csv'))

TriggerSensitivity.import columns, values

# Import recording length data from csv
columns = [:length]
values = CSV.read(Rails.root.join('db/seed_data/recording_lengths.csv'))

RecordingLength.import columns, values

# Import local habitat data from csv
columns = [:label]
values = CSV.read(Rails.root.join('db/seed_data/local_habitats.csv'))

LocalHabitat.import columns, values

# Import local habitat data from csv
columns = [:label]
values = CSV.read(Rails.root.join('db/seed_data/geodetic_systems.csv'))

GeodeticSystem.import columns, values

# TODO: get a file with all sample units
# This will hopefully just work once I clean the data with all the sample units

# Import sample unit data from csv
columns = [:grts, :broad_habitat_id, :broad_habitat_form_id]
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
