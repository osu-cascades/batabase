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

  trait :admin do
    role { :admin }
  end

  trait :field_agent do
    role { :field_agent }
  end

  trait :confirmed do
    confirmed_at { Time.now.utc }
  end
end
