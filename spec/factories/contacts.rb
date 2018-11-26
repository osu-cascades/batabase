FactoryBot.define do
  factory :contact do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    organization { 'ODFW' }
    state_code { 'ID' }
    email { Faker::Internet.email }
    created_by { 'TODO' }
    last_modified_by { 'TODO' }
  end
end
