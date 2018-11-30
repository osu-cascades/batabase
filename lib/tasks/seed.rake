namespace :seeds do
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
    %w(waterbody
    drywater
    rock
    meadow
    forestedge
    forestopening
    other).each do |label|
      DetectionTarget.create!(label: label)
    end
  end
end
