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

# Import detection target data from csv
columns = [:label]
values = CSV.read(Rails.root.join('db/seed_data/detection_targets.csv'))

DetectionTarget.import columns, values

# Import target descriptor data from csv
columns = [:detection_target_id, :label]
values = CSV.read(Rails.root.join('db/seed_data/target_descriptors.csv'))

TargetDescriptor.import columns, values

# Import broad habitat data from csv
columns = [:label]
values = CSV.read(Rails.root.join('db/seed_data/broad_habitats.csv'))

BroadHabitat.import columns, values

# Import broad habitat form data from csv
columns = [:broad_habitat_id, :label]
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

# TODO: figure out how to define my own id when importing the sample units
# TODO: once that works see if it can continue on sequence after import?
# Import sample unit data from csv
# columns = [:sample_unit_id, :grts, :broad_habitat_id, :broad_habitat_form_id]
# values = CSV.read(Rails.root.join('db/seed_data/sample_units.csv'))

# SampleUnit.import columns, values
