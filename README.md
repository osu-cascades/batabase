# Batabase [![Build Status](https://travis-ci.org/osu-cascades/batabase.svg?branch=develop)](https://travis-ci.org/osu-cascades/batabase)

Database of bat population data for the Northwestern Bat Hub.

## Getting Started

### Setup

#### brew & rvm

Below are the steps/requirements needed to run the app:

- Postgresql: `brew install postgresql`
- Ruby 2.6.5: `rvm use ruby-2.6.5`
- Clone the repo: `git clone git@github.com:osu-cascades/batabase.git`
- Change directory: `cd batabase`
- Run bundler: `bundle install`

#### apt & rbenv

TODO: this

## Development

Start the server by running

- `rails server`

### Test Coverage

Batabase uses the [simplecov](https://github.com/colszowka/simplecov) gem to supply code coverage metrics.
To view code coverage run the test suite by running `rspec` or `rspec -f d` (this one is personally preferred) and open `coverage/index.html` in a browser.

## Data model

![erd](erd.jpg?raw=true)

&copy; 2019 Dylan Drudge, Bryce Graves, Mack Hatfield, Nathan Struhs. All rights reserved.
