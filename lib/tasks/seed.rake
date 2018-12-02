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
    puts 'Created testing bois'
  end

  desc 'Destroy all users'
  task 'destroy_users' => :environment do
    User.delete_all
    puts 'Deleted those bois'
  end

  desc 'Seed detection targets'
  task 'detection_targets' => :environment do
    %w(Waterbody
    Drywater
    Rock
    Meadow
    Forestedge
    Forestopening
    Other).each do |label|
      DetectionTarget.create!(label: label)
    end
    puts 'Created detection targets'
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
      { fk: 2,	label: 'Large canyon bottom' },
      { fk: 2,	label: 'Large canyon top' },
      { fk: 2,	label: 'Small arroyo dry gulch bottom' },
      { fk: 2,	label: 'Small arroyo dry gulch top' },
      { fk: 3,	label: 'Ridge top' },
      { fk: 3,	label: 'Cliff bottom' },
      { fk: 3,	label: 'Cliff top' },
      { fk: 4,	label: 'Large' },
      { fk: 4,	label: 'Medium' },
      { fk: 4,	label: 'Small' },
      { fk: 5,	label: 'Old young forest' },
      { fk: 5,	label: 'Forest open land' },
      { fk: 6,	label: 'Small gap' },
      { fk: 6,	label: 'Trail' },
      { fk: 6,	label: 'Roadway' } ].each do |record|
        TargetDescriptor.create!(detection_target_id: record.fetch(:fk), label: record.fetch(:label))
    end
    puts 'Created target descriptors'
  end

  desc 'Seed study areas'
  task 'study_areas' => :environment do
    StudyArea.create!(name: 'Oregon Bat Grid 2.0', state: State.where(state_code: 'OR').first)
    puts 'Created study areas'
  end
end
