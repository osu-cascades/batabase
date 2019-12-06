FactoryBot.define do
  factory :contact do
    state
    last_name { 'FAKE LAST NAME' }
    first_name { 'FAKE FIRST NAME' }
    notes { 'FAKE NOTES' }
    
    trait :has_organization do
      organization
    end
  end
end