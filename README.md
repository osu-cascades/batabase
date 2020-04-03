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

- Set local ruby version either via rvm `rvm use ruby-2.6.5` or rbenv `rbenv local 2.6.5`
- Install gems: `bundle install` (If this fails ensure you have bundler installed. Bundler 2+ suggested)
- Build the database: `rake db:create db:migrate db:seed` (If this fails ensure that you have a postgres database created for your \$USER account)
- Run the server: `rails s`

### Test Coverage

Batabase uses the [simplecov](https://github.com/colszowka/simplecov) gem to supply code coverage metrics.
To view code coverage run the test suite by running `rspec` or `rspec -f d` (this one is personally preferred) and open `coverage/index.html` in a browser.

## Data model

![erd](erd.png?raw=true)

## Project TODO list

### Component

- [ ] move alert component logic into the component class
- [ ] move datagrid into it's own component
- [ ] add tests for upload list component
- [ ] add tests for upload component

### Data

- [ ] add species and species group models where they have a many to many relationship
- [ ] update all seeding data using current access data
- [x] look into new sample unit data to see what must be done to use that instead of the current sample unit set
- [x] add detector location seeding data and seed it
- [x] add extra columns to detector locations from the data
- [x] add fake detector data to build test database
- [x] swap out activerecord-import for the new rails 6 method of bulk building data from pre made datasets (activerecord-import is better for our use case)
- [x] finishing cleaning sample unit data

### General

- [ ] swap out custom component use to the system used by github
- [ ] add user login using devise
- [ ] normalize table create file and class names
- [ ] normalize names to either use label or name across models
- [ ] add system tests for datagrid for better coverage
- [x] add ERD to readme

### Model

- [ ] add species group as either table or add to deployment model (verify in access for this decision)
- [ ] add has many relation (species_group->sample_unit)
- [ ] add belongs to relation (sample_unit->species_group)
- [ ] add tests to show that dependent destroy interactions are working correctly
- [ ] refactor detector location spec test for callback function
- [ ] refactor sample unit tests and test groupings
- [ ] use the data from "xrefSpeciesSpeciesGroup.csv" as a way to build the relationships when creating species and species groups
- [x] add microphone type as either table or add to deployment model (verify in access for this decision)
- [x] add distance range as either table or add to deployment model (verify in access for this decision)
- [x] add tests for clutter type associations
- [x] add tests for clutter percent associations
- [x] look into combining orientation into associated models
- [x] recovery contact is just a contact with a deployment attached to it. make a recovery contact (Found a nice solution for this)
- [x] add clutter type to either the deployment model or make a look up table if there are many
- [x] create detector locations table and it's associations
- [x] add has many relation (detection_target->detector_location)
- [x] add belongs to relation (detector_location->detection_target)
- [x] add has many relation (target_descriptor->detector_location)
- [x] add belongs to relation (detector_location->target_descriptor)
- [x] ensure that contacts have all specified relationships and they are tested
- [x] finish modeling software
- [x] put software model under test
- [x] add detector location model (belongs to sample unit)
- [x] add belongs to relation (detector_location->sample_unit)
- [x] add has many relation (sample_unit->detector_location)
- [x] figure out if recovery contact is an organization or if it should inherit through contact
- [x] remove "FederalAgency" field from sample_unit

### Workflow

- [ ] convert upload workflow to use manually made upload form
- [ ] ensure that tests are correctly testing all portions of the workflow
- [x] add test for workflow
- [x] add workflow for parsing data
- [x] make sure that workflow is fully unit tested

&copy; 2019 Dylan Drudge, Bryce Graves, Mack Hatfield, Nathan Struhs. All rights reserved.
