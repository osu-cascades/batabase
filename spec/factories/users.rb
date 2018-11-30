FactoryBot.define do
  factory :user do
    state
    organization
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
    role { :guest }
  end

  factory :admin do
    role { :admin }
  end

  factory :field_agent do
    rold { :field_agent }
  end
end
