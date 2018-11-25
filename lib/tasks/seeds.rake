
namespace :seeds do
    desc "create users"
    task "create_users" => :environment do
        User.create!(
            email: 'nathanstruhs@gmail.com',
            password: 'password',
            password_confirmation: 'password',
            confirmed_at: Time.now.utc,
            role: :admin
          )
          
          User.create!(
            email: 'drudged@oregonstate.edu',
            password: 'password',
            password_confirmation: 'password',
            confirmed_at: Time.now.utc,
            role: :admin
          )
          
          User.create!(
            email: 'guest@guest.com',
            password: 'password',
            password_confirmation: 'password',
            confirmed_at: Time.now.utc,
            role: :guest
          )
          
          User.create!(
            email: 'field-agent@field-agent.com',
            password: 'password',
            password_confirmation: 'password',
            confirmed_at: Time.now.utc,
            role: :field_agent
          )
          
          User.create!(
            email: 'admin@admin.com',
            password: 'password',
            password_confirmation: 'password',
            confirmed_at: Time.now.utc,
            role: :admin
          )
          
          10.times do |i|
            User.create!(
              email: "guest-#{i}@guest.com",
              password: 'password',
              password_confirmation: 'password',
              confirmed_at: Time.now.utc,
              role: :guest
            )
          end   
          puts "created testing bois"       
    end
    desc "create users"
    task "destroy_users" => :environment do
        User.delete_all  
        puts "deleted those bois"  
    end
end  