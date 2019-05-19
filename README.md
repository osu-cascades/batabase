# Batabase

Database of bat population data for the Northwestern Bat Hub.

## Getting Started

Below are the steps/requirements needed to run the app:
* Postgresql `brew install postgresql`
* Ruby 2.5.1 `rvm use ruby-2.5.1`
* Clone the repo `git clone git@github.com:osu-cascades/batabase.git`
* Change directory `cd batabase`

After cloning the repository, you can:

`npm run init`

^ This takes a while as it's a big script

Start the application by:

`npm run start`

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
