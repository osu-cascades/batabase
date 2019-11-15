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