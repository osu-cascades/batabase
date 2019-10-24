require 'activerecord-import/base'
# load the appropriate database adapter (postgresql, mysql2, sqlite3, etc)
require 'activerecord-import/active_record/adapters/postgresql_adapter'
require 'csv'
require_relative '../sample_unit_creator'
require_relative '../broad_habitat_creator'

namespace :seed do
  desc 'Create initial test users'
  task 'create_users' => :environment do
    %w(nathanstruhs@gmail.com drudged@oregonstate.edu admin@admin.com).each do |email|
      User.create!(
        first_name: 'Admin',
        last_name: 'McAdmin',
        email: email,
        password: 'password',
        password_confirmation: 'password',
        confirmed_at: Time.now.utc,
        role: :admin,
        state: State.where(state_code: 'OR').first,
        organization: Organization.first
      )
    end

    5.times do |i|
      User.create!(
        first_name: 'Agent',
        last_name: 'McAgent',
        email: "field-agent-#{i}@field-agent.com",
        password: 'password',
        password_confirmation: 'password',
        confirmed_at: Time.now.utc,
        role: :field_agent,
        state: State.where(state_code: 'OR').first,
        organization: Organization.first
      )
    end

    5.times do |i|
      User.create!(
        first_name: 'Guest',
        last_name: 'McGuest',
        email: "guest-#{i}@guest.com",
        password: 'password',
        password_confirmation: 'password',
        confirmed_at: Time.now.utc,
        role: :guest,
        state: State.where(state_code: 'OR').first,
        organization: Organization.first
      )
    end

    puts 'Users Seeded Successfully'
  end

  desc 'Destroy all users'
  task 'destroy_users' => :environment do
    User.delete_all

    puts 'Users Deleted Successfully'
  end

  desc 'Seed detection targets'
  task 'detection_targets' => :environment do
    ["Waterbody",
    "Drywater",
    "Rock",
    "Meadow",
    "Forest Edge",
    "Forest Opening",
    "Other"].each do |label|
      DetectionTarget.create!(label: label)
    end
    puts 'Detection Targets Seeded Successfully'
  end

  desc 'Seed target descriptors'
  task 'target_descriptors' => :environment do
    [ { fk: 1,	label: 'River' },
      { fk: 1,	label: 'Stream' },
      { fk: 1,	label: 'Spring' },
      { fk: 1,	label: 'Lake' },
      { fk: 1,	label: 'Pond' },
      { fk: 1,	label: 'Wetland' },
      { fk: 1,	label: 'Stocktank / Trough' },
      { fk: 2,	label: 'Large Canyon Bottom' },
      { fk: 2,	label: 'Large Canyon Top' },
      { fk: 2,	label: 'Small Arroyo Dry Gulch Bottom' },
      { fk: 2,	label: 'Small Arroyo Dry Gulch Top' },
      { fk: 3,	label: 'Ridge Top' },
      { fk: 3,	label: 'Cliff Bottom' },
      { fk: 3,	label: 'Cliff Top' },
      { fk: 4,	label: 'Large' },
      { fk: 4,	label: 'Medium' },
      { fk: 4,	label: 'Small' },
      { fk: 5,	label: 'Old Young Forest' },
      { fk: 5,	label: 'Forest Open Land' },
      { fk: 6,	label: 'Small Gap' },
      { fk: 6,	label: 'Trail' },
      { fk: 6,	label: 'Roadway' } ].each do |record|
        TargetDescriptor.create!(detection_target_id: record.fetch(:fk), label: record.fetch(:label))
    end
    puts 'Target Descriptors Seeded Successfully'
  end

  desc 'Seed study areas'
  task 'study_areas' => :environment do
    StudyArea.create!(name: 'Oregon Bat Grid 2.0', state: State.where(state_code: 'OR').first)
    puts 'Created study areas'
  end

  desc 'Seed broad habitats and broad habitat forms'
  task 'broad_habitats' => :environment do
    BroadHabitatCreator.new
    puts 'Broad Habitats and Broad Habitat Forms Seeded Successfully'
  end

  desc 'Seed Counties'
  task 'counties' => :environment do
    columns = [:state_id, :name]
    values = CSV.read(Rails.root.join('./lib/counties.csv'))

    County.import columns, values, validate: false, on_duplicate_key_update: { conflict_target: [:id] }
  end

  desc 'Seed sample units'
  task 'sample_units' => :environment do
    SampleUnitCreator.new

    puts 'Sample Units Seeded Successfully'
  end

  desc "Seed contact's state_id with correct state.id"
  task 'contact_state_id' => :environment do
    Contact.all.each do |contact|
      contact_state_code = contact.attributes['state_code']
      next if contact_state_code.nil?

      state = State.where(state_code: contact_state_code).first
      next if state.nil?

      next if contact.state_id != nil
      contact.state_id = state.try(:id)
      contact.save!
    end
    puts "Contact State Id Seeded Successfully"
  end

  desc "Seed contact's organization_id with correct organization.id"
  task 'contact_organization_id' => :environment do
    Contact.all.each do |contact|
      contact_organization = contact.attributes['organization']
      next if contact_organization.nil?

      organization = Organization.where(label: contact_organization).first

      next if organization.nil?
      next if contact.organization_id != nil

      contact.organization_id = organization.try(:id)
      contact.save!
    end
    puts "Contact Organization Id Seeded Successfully"
  end

  desc "Seed one organization"
  task 'populate_one_organization' => :environment do
    Organization.create!(label: "Oregon Department of Fish and Wildlife")
    puts "A Single Organization Was Seeded Successfully"
  end

  desc "Seed states"
  task 'states' => :environment do
    columns = [:state_name, :state_code]
    values = CSV.read(Rails.root.join('./lib/states.csv'))

    State.import columns, values, validate: false, on_duplicate_key_update: { conflict_target: [:id] }

    puts "All States Were Seeded Successfully"
  end
end
