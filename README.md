# Batabase

Database of bat population data for the Northwestern Bat Hub.

## Getting Started

Below are the steps/requirements needed to run the app:
* Postgresql `brew install postgresql`
* Ruby 2.5.1 `rvm use ruby-2.5.1`
* Clone the repo `git clone git@github.com:osu-cascades/batabase.git`
* Change directory `cd batabase`

This is a Rails application. After cloning the repository, you can:

* Install rails dependencies with `bundle install`
* Install javascript dependencies with `npm i`
* Populate database from MS Access DB dump with `sh script/createdb.sh`
* Run DB migrations with `bundle exec rake db:migrate`
* Create test database with `bundle exec rake db:test:prepare`

Start the application by:

* Run the server in _development_ with `rails server`
* Compile assets with `./bin/webpack-dev-server`
* Use guard to run/monitor specs with `bundle exec guard`

## Development

### Frontend Components

Create frontend components by running the component generator `rails g component <component-name>`. Include the component in the view ERB template with the application helper `#render_component`.

Components will be generated in `app/javascript`

### Populating Database in Staging Environment on Heroku

* Run `heroku pg:reset --remote staging` ! This will drop the database
* Push local database to heroku `heroku pg:push batabase_development DATABASE_URL --remote staging`

### Test Coverage

Batabase uses the [simplecov](https://github.com/colszowka/simplecov) gem to supply code coverage metrics. To view code coverage run the test suite `bundle exec rspec` and open `coverage/index.html` in a browser.

&copy; 2018 Nathan Struhs, Dylan Drudge. All rights reserved.
