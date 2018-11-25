
namespace :seeds do
  desc 'Create initial test users'
  task 'create_users' => :environment do
    %w(nathanstruhs@gmail.com drudged@oregonstate.edu admin@admin.com).each do |email|
      User.create!(
        email: email,
        password: 'password',
        password_confirmation: 'password',
        confirmed_at: Time.now.utc,
        role: :admin
      )
    end

    5.times do |i|
      User.create!(
        email: "field-agent-#{i}@field-agent.com",
        password: 'password',
        password_confirmation: 'password',
        confirmed_at: Time.now.utc,
        role: :field_agent
      )
    end

    5.times do |i|
      User.create!(
        email: "guest-#{i}@guest.com",
        password: 'password',
        password_confirmation: 'password',
        confirmed_at: Time.now.utc,
        role: :guest
      )
    end

    puts 'Created testing bois'
  end

  desc 'Destroy all users'
  task 'destroy_users' => :environment do
    User.delete_all
    puts 'Deleted those bois'
  end
end
