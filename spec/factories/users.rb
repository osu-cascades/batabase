FactoryBot.define do
  factory :user do
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    middle_init { Faker::Name.initials(1) }
    initials { Faker::Name.initials(3) }
    years_of_experience { Faker::Number.number(1) }
    organization { 'ODFW' }
    position_title { 'Example Title' }
    address_type { 'Example Address Type' }
    address { Faker::Address.street_address }
    address_2 { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state_code { 'ID' }
    zip_code { Faker::Address.zip_code }
    country { Faker::Address.country }
    email_address { Faker::Internet.email }
    work_phone { Faker::PhoneNumber.phone_number }
    work_extension { Faker::PhoneNumber.extension }
    contact_notes { 'Example Notes' }
    created_by { 'TODO' }
    last_modified_by { 'TODO' }
  end
end
