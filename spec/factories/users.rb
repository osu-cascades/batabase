FactoryBot.define do
  factory :user do
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    organization { 'ODFW' }
    state_code { 'ID' }
    email { Faker::Internet.email }
    contact_notes { 'Example Notes' }
    created_by { 'TODO' }
    last_modified_by { 'TODO' }
  end
end
