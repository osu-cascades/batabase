# Batabase [![Build Status](https://travis-ci.org/osu-cascades/batabase.svg?branch=develop)](https://travis-ci.org/osu-cascades/batabase)

Database of bat population data for the Northwestern Bat Hub.

## Getting Started

### Requirements

Below are requirements and their versions running this project locally. It is up to you to setup any required tools that you may need.

- Postgresql: `10`
- Ruby: `2.6.5`
- Repo: `git@github.com:osu-cascades/batabase.git`
- Bundler: `2+`

### First Time Setup

- Set local ruby version either via rvm: `rvm use ruby-2.6.5` or rbenv `rbenv local 2.6.5`
- Install gems: `bundle install` (If this fails ensure you have bundler installed. Bundler 2+ suggested)
- Build the database: `rake db:create db:migrate db:seed` (If this fails ensure that you have a postgres database created for your \$USER account)
- Run the server: `rails s`

### Test Coverage

Batabase uses the [simplecov](https://github.com/colszowka/simplecov) gem to supply code coverage metrics.
To view code coverage run the test suite by running `rspec` or `rspec -f d` (this one is personally preferred) and open `coverage/index.html` in a browser.

## Data model

![erd](erd.png?raw=true)

&copy; 2019 Dylan Drudge, Bryce Graves, Mack Hatfield, Nathan Struhs. All rights reserved.
