# Batabase [![Build Status](https://travis-ci.org/osu-cascades/batabase.svg?branch=master)](https://travis-ci.org/osu-cascades/batabase)

Database of bat population data for the Northwestern Bat Hub.

## Getting Started

### Setup

#### brew & rvm

Below are the steps/requirements needed to run the app:

* Postgresql `brew install postgresql`
* Ruby 2.5.1 `rvm use ruby-2.5.1`
* Clone the repo `git clone git@github.com:osu-cascades/batabase.git`
* Change directory `cd batabase`

#### apt & rbenv

TODO: this

Start the application by running commands **sequentially** in seperate terminal tabs or windows:

* `rails server`
* `./bin/webpack-dev-server`
* `bundle exec guard`

## Development

### Frontend Components

Create frontend components by running the component generator `rails g component <component-name>`.
Include the component in the view ERB template with the application helper `#render_component`.

Components will be generated in `app/javascript`

### Populating Database in Staging Environment on Heroku

* Run `heroku pg:reset --remote staging` ! This will drop the database
* Push local database to heroku `heroku pg:push batabase_development DATABASE_URL --remote staging`

### Test Coverage

Batabase uses the [simplecov](https://github.com/colszowka/simplecov) gem to supply code coverage metrics.
To view code coverage run the test suite `bundle exec rspec` and open `coverage/index.html` in a browser.

&copy; 2019 Dylan Drudge, Bryce Graves, Mack Hatfield, Nathan Struhs. All rights reserved.
