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

Start the application by:

* Run the server in _development_ with `rails server`
* Compile assets with `./bin/webpack-dev-server`
* Use guard to run/monitor specs with `bundle exec guard`

## Development

### Frontend Components

Create frontend components by running the component generator `rails g component <component-name>`. Include the component in the view ERB template with the application helper `#render_component`.

### Populating the Database

* Navigate to the project root
* Run script: `sh script/createdb.sh`

&copy; 2018 Nathan Struhs, Dylan Drudge. All rights reserved.
