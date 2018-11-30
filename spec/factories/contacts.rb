FactoryBot.define do
  factory :contact do
    state { State.first || association(:state) }
    organization { Organization.first || association(:organization) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
  end
end
