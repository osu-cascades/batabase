# Batabase

Database of bat population data for the Northwestern Bat Hub.

## Getting Started

Below are the steps/requirements needed to run the app:
* Postgresql `brew install postgresql`
* Ruby 2.5.1 `rvm use ruby-2.5.1`
* Clone the repo `git clone git@github.com:osu-cascades/batabase.git`
* Change directory `cd batabase`

This is a Rails application. After cloning the repository, you can:

* Install dependencies with `bundle install`.

Start the application by:

* Run the server in _development_ with `rails server`.
* Compile assets with `./bin/webpack-dev-server`
* Use guard to run/monitor specs with `bundle exec guard`.

## Development

### Frontend Components

Create frontend components by running the component generator `rails g component <component-name>`. Include the component in the view ERB template with the application helper `#render_component`.

## Pulling down MS Access data

* create local database: `createdb batabase_development`
* Navigate to the lib directory: `cd batabase/lib`
* Dump db: `psql -d batabase_development -f dump.sql`
* Modify db: `psql -d batabase_development -f update-db.sql`


&copy; 2018 Nathan Struhs, Dylan Drudge. All rights reserved.
